var moveX = oInput.moveX;
var moveY = oInput.moveY;
var isMoving = moveX != 0 || moveY != 0;

if (state == PlayerState.IDLE && isMoving) {
	state = PlayerState.WALKING;
} else if (state == PlayerState.WALKING && !isMoving) {
	state = PlayerState.IDLE;
}



var lastSprite = sprite_index;
switch (state) {
	case PlayerState.IDLE: {
		sprite_index = sPlayerIdle;
	} break;

	case PlayerState.WALKING: {
		sprite_index = sPlayerWalking;

		if (moveX != 0) {
			facingDirection = moveX < 0 ? 2 : 0;
		} else {
			facingDirection = moveY < 0 ? 1 : 3;
		}

		var backgroundTilesLayerId = layer_get_id("BackgroundTiles");
		var backgroundTilesTilemapId = layer_tilemap_get_id(backgroundTilesLayerId);
		var xNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x + moveX, y);
		var yNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x, y + moveY);
		var diagonalNextTile = tilemap_get_at_pixel(backgroundTilesTilemapId, x + moveX, y + moveY);

		// These checks cover horizontal, vertical, and diagonal concave corner collsions.
		var tileCollisionHappened = false;
		if (isTileSolid(xNextTile)) {
			if (moveX > 0) {
				x = floor(x);
			} else {
				x = ceil(x);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x + sign(moveX), y))) {
				x += sign(moveX);
			}

			moveX = 0;
			tileCollisionHappened = true;
		}
		if (isTileSolid(yNextTile)) {
			if (moveY > 0) {
				y = floor(y);
			} else {
				y = ceil(y);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x, y + sign(moveY)))) {
				y += sign(moveY);
			}

			moveY = 0;
			tileCollisionHappened = true;
		}

		// This check covers diagonal collisions at a convex corner.
		if (!tileCollisionHappened && isTileSolid(diagonalNextTile)) {
			if (moveY > 0) {
				y = floor(y);
			} else {
				y = ceil(y);
			}

			while (!isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, x, y + sign(moveY)))) {
				y += sign(moveY);
			}

			moveY = 0;
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

localFrame += sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
if (localFrame >= totalFrames) {
	localFrame -= totalFrames;
}

x += moveX;
y += moveY;
