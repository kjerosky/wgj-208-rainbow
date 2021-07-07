if (oGameState.state != ControlState.PLAYER_NOT_DETECTED) {
	exit;
}

var reachedStart = moveAlongX ? x <= startValue : y <= startValue;
var reachedEnd = moveAlongX ? x >= endValue : y >= endValue;

if (state == SecurityMovingState.MOVE_TO_END && reachedEnd) {
	state = SecurityMovingState.WAIT_AT_END;

	waitFramesLeft = TOTAL_WAIT_FRAMES;
} else if (state == SecurityMovingState.WAIT_AT_END && waitFramesLeft <= 0) {
	state = SecurityMovingState.MOVE_TO_START;
} else if (state == SecurityMovingState.MOVE_TO_START && reachedStart) {
	state = SecurityMovingState.WAIT_AT_START;

	waitFramesLeft = TOTAL_WAIT_FRAMES;
} else if (state == SecurityMovingState.WAIT_AT_START && waitFramesLeft <= 0) {
	state = SecurityMovingState.MOVE_TO_END;
}



switch (state) {
	case SecurityMovingState.MOVE_TO_END: {
		if (moveAlongX) {
			x += moveSpeed;
			if (x > endValue) {
				x = endValue;
			}
		} else {
			y += moveSpeed;
			if (y > endValue) {
				y = endValue;
			}
		}
	} break;
	
	case SecurityMovingState.MOVE_TO_START: {
		if (moveAlongX) {
			x -= moveSpeed;
			if (x < startValue) {
				x = startValue;
			}
		} else {
			y -= moveSpeed;
			if (y < startValue) {
				y = startValue;
			}
		}
	} break;
	
	case SecurityMovingState.WAIT_AT_START:
	case SecurityMovingState.WAIT_AT_END: {
		waitFramesLeft--;
	} break;
	
	default: {
		// do nothing
	}
}



vision.x = x;
vision.y = y;
