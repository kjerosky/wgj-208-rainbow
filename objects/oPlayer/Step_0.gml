function isTileSolid(tile) {
	return tile >= 0 && tile < 5;
}

var moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var moveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));



var lastSprite = sprite_index;
if (moveX != 0) {
	sprite_index = sPlayerWalking;
	facingDirection = moveX < 0 ? 2 : 0;
} else if (moveY != 0) {
	sprite_index = sPlayerWalking;
	facingDirection = moveY < 0 ? 1 : 3;
} else {
	sprite_index = sPlayerIdle;
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

x += moveX;
y += moveY;
