if (oGameState.state != ControlState.PLAYER_NOT_DETECTED) {
	exit;
}

vision.x = x;
vision.y = y;
vision.image_angle += rotationSpeed;

vision.isPlayerTouchingAssociatedSecurity = place_meeting(x, y, oPlayer);
