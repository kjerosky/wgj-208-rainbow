if (oGameState.state != ControlState.PLAYER_NOT_DETECTED) {
	exit;
}

var reachedStart = rotationAngle <= startValue;
var reachedEnd = rotationAngle >= endValue;

if (state == SecurityPanningState.ROTATE_TO_END && reachedEnd) {
	state = SecurityPanningState.WAIT_AT_END;

	waitFramesLeft = TOTAL_WAIT_FRAMES;
} else if (state == SecurityPanningState.WAIT_AT_END && waitFramesLeft <= 0) {
	state = SecurityPanningState.ROTATE_TO_START;
} else if (state == SecurityPanningState.ROTATE_TO_START && reachedStart) {
	state = SecurityPanningState.WAIT_AT_START;

	waitFramesLeft = TOTAL_WAIT_FRAMES;
} else if (state == SecurityPanningState.WAIT_AT_START && waitFramesLeft <= 0) {
	state = SecurityPanningState.ROTATE_TO_END;
}



switch (state) {
	case SecurityPanningState.ROTATE_TO_END: {
		rotationAngle += rotationSpeed;
		if (rotationAngle > endValue) {
			rotationAngle = endValue;
		}
	} break;
	
	case SecurityPanningState.ROTATE_TO_START: {
		rotationAngle -= rotationSpeed;
		if (rotationAngle < startValue) {
			rotationAngle = startValue;
		}
	} break;
	
	case SecurityPanningState.WAIT_AT_START:
	case SecurityPanningState.WAIT_AT_END: {
		waitFramesLeft--;
	} break;
	
	default: {
		// do nothing
	}
}



vision.x = x;
vision.y = y;
vision.image_angle = rotationAngle;

vision.isPlayerTouchingAssociatedSecurity = place_meeting(x, y, oPlayer);
