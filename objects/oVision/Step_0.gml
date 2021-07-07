var playerX = oPlayer.x;
var playerY = oPlayer.y;

image_blend = NOT_DETECTING_PLAYER_COLOR;
var canSeePlayer = instance_position(playerX, playerY, self);
if (!canSeePlayer) {
	exit;
}



var startX = x;
var startY = y;
var endX = playerX;
var endY = playerY;
var xDistance = abs(endX - startX);
var yDistance = abs(endY - startY);
var totalSteps = max(xDistance, yDistance);

var backgroundTilesLayerId = layer_get_id("BackgroundTiles");
var backgroundTilesTilemapId = layer_tilemap_get_id(backgroundTilesLayerId);
for (var step = 0; step <= totalSteps; step++) {
	var percent = 1 / totalSteps * step;
	var checkX = lerp(startX, endX, percent);
	var checkY = lerp(startY, endY, percent);
	if (isTileSolid(tilemap_get_at_pixel(backgroundTilesTilemapId, checkX, checkY))) {
		exit;
	}
}

image_blend = DETECTING_PLAYER_COLOR;

if (oGameState.state != ControlState.ALARMING) {
	oGameState.state = ControlState.START_ALARMING;
}
