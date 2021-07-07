var isMoving = oInput.moveMagnitude != 0;

if (state == PlayerState.IDLE && isMoving) {
	state = PlayerState.MOVING;
} else if (state == PlayerState.MOVING && !isMoving) {
	state = PlayerState.IDLE;
}



var moveSpeed = oInput.runIsPressed ? RUNNING_SPEED : WALKING_SPEED;
var xSpeed = 0;
var ySpeed = 0;
var lastSprite = sprite_index;
switch (state) {
	case PlayerState.IDLE: {
		sprite_index = sPlayerIdle;
	} break;

	case PlayerState.MOVING: {
		sprite_index = sPlayerMoving;

		xSpeed = moveSpeed * oInput.moveX;
		ySpeed = moveSpeed * oInput.moveY;

		var moveOctant = floor(((oInput.moveDirection + 22.5) % 360) / 45);
		if (moveOctant != facingOctant && moveOctant != octantLeftOfFacingOctant && moveOctant != octantRightOfFacingOctant) {
			if (moveOctant >= 3 && moveOctant <= 5) {
				facingOctant = 4;
			} else if (moveOctant == 2 || moveOctant == 6) {
				facingOctant = moveOctant;
			} else {
				facingOctant = 0;
			}

			octantLeftOfFacingOctant = facingOctant + 1;
			octantRightOfFacingOctant = facingOctant == 0 ? 7 : facingOctant - 1;
		}

		var backgroundTilesLayerId = layer_get_id("BackgroundTiles");
		var backgroundTilesTilemapId = layer_tilemap_get_id(backgroundTilesLayerId);
		var xNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x + xSpeed, y);
		var yNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x, y + ySpeed);
		var diagonalNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x + xSpeed, y + ySpeed);

		// These checks cover horizontal, vertical, and diagonal concave corner collsions.
		var tileCollisionHappened = false;
		if (isTileSolid(xNextTile)) {
			if (xSpeed > 0) {
				x = floor(x);
			} else {
				x = ceil(x);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x + sign(xSpeed), y))) {
				x += sign(xSpeed);
			}

			xSpeed = 0;
			tileCollisionHappened = true;
		}
		if (isTileSolid(yNextTile)) {
			if (ySpeed > 0) {
				y = floor(y);
			} else {
				y = ceil(y);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x, y + sign(ySpeed)))) {
				y += sign(ySpeed);
			}

			ySpeed = 0;
			tileCollisionHappened = true;
		}

		// This check covers diagonal collisions at a convex corner.
		// We'll bias for horizontal movement in this case.
		if (!tileCollisionHappened && isTileSolid(diagonalNextTile)) {
			if (ySpeed > 0) {
				y = floor(y);
			} else {
				y = ceil(y);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x + xSpeed, y + sign(ySpeed)))) {
				y += sign(ySpeed);
			}

			ySpeed = 0;
			tileCollisionHappened = true;
		}
	} break;

	default: {
		// do nothing
	}
}



if (lastSprite != sprite_index) {
	localFrame = 0;
}

var totalFrames = sprite_get_number(sprite_index) / TOTAL_SPRITE_FACING_DIRECTIONS;
var facingDirection = facingOctant / 2;
image_index = (facingDirection * totalFrames) + localFrame;

localFrame += (moveSpeed / WALKING_SPEED) * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
if (localFrame >= totalFrames) {
	localFrame -= totalFrames;
}

x += xSpeed;
y += ySpeed;



var collectedCrystal = instance_place(x, y, oCrystal);
if (collectedCrystal != noone) {
	instance_destroy(collectedCrystal);
}

var touchedSavePoint = instance_place(x, y, oSavePoint);
if (touchedSavePoint != noone) {
	oGameState.savePointX = touchedSavePoint.x + touchedSavePoint.image_xscale / 2;
	oGameState.savePointY = touchedSavePoint.y + touchedSavePoint.image_yscale / 2;
}

if (oInput.debugResetWasPressed) {
	x = oGameState.savePointX;
	y = oGameState.savePointY;
}
