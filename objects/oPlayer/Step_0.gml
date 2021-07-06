var moveX = oInput.moveX;
var moveY = oInput.moveY;
var runIsPressed = oInput.runIsPressed;
var isMoving = moveX != 0 || moveY != 0;

if (state == PlayerState.IDLE && isMoving) {
	state = PlayerState.MOVING;
} else if (state == PlayerState.MOVING && !isMoving) {
	state = PlayerState.IDLE;
}



var moveSpeed = runIsPressed ? RUNNING_SPEED : WALKING_SPEED;
var xSpeed = 0;
var ySpeed = 0;
var lastSprite = sprite_index;
switch (state) {
	case PlayerState.IDLE: {
		sprite_index = sPlayerIdle;
	} break;

	case PlayerState.MOVING: {
		sprite_index = sPlayerMoving;

		xSpeed = moveSpeed * moveX;
		ySpeed = moveSpeed * moveY;

		if (xSpeed != 0) {
			facingDirection = xSpeed < 0 ? 2 : 0;
		} else {
			facingDirection = ySpeed < 0 ? 1 : 3;
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
		if (!tileCollisionHappened && isTileSolid(diagonalNextTile)) {
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
	} break;

	default: {
		// do nothing
	}
}



if (lastSprite != sprite_index) {
	localFrame = 0;
}

var totalFrames = sprite_get_number(sprite_index) / 4;
image_index = (facingDirection * totalFrames) + localFrame;

localFrame += (moveSpeed / WALKING_SPEED) * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
if (localFrame >= totalFrames) {
	localFrame -= totalFrames;
}

x += xSpeed;
y += ySpeed;
