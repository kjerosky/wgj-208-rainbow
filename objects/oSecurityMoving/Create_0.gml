enum SecurityMovingState {
	MOVE_TO_END,
	WAIT_AT_END,
	MOVE_TO_START,
	WAIT_AT_START
};

state = SecurityMovingState.MOVE_TO_END;

moveSpeed = 1;
TOTAL_WAIT_FRAMES = 60;
waitFramesLeft = 0;

moveAlongX = true;
startValue = x;
endValue = x;

vision = instance_create_layer(x, y, "Vision", oVision);
