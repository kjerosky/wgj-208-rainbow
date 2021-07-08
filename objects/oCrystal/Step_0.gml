if (oGameState.state != ControlState.PLAYER_NOT_DETECTED) {
	exit;
}

yOffsetChangeFramesLeft--;
if (yOffsetChangeFramesLeft <= 0) {
	yOffsetIndex = (yOffsetIndex + 1) % Y_OFFSETS_SIZE;

	yOffsetChangeFramesLeft = Y_OFFSET_CHANGE_FRAMES;
}

y = ystart + Y_OFFSETS[yOffsetIndex];
