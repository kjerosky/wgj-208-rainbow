enum SecurityPanningState {
	ROTATE_TO_END,
	WAIT_AT_END,
	ROTATE_TO_START,
	WAIT_AT_START
};

state = SecurityPanningState.ROTATE_TO_END;

rotationAngle = 0;
rotationSpeed = 1;
TOTAL_WAIT_FRAMES = 60;
waitFramesLeft = 0;

startValue = 0;
endValue = 0;

vision = instance_create_layer(x, y, "Vision", oVision);
