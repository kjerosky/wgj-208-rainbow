enum TimeTrackingState {
	SIGNAL_RUNNING,
	RUNNING,
	SIGNAL_PAUSED,
	PAUSED
};

timeTrackingState = TimeTrackingState.RUNNING;

alerts = 0;
global.alerts = 0;

currentStartTime = 0;
bankedTime = 0;
global.time = 0;

TIME_X = 3;
TIME_Y = 3;
ALERTS_X = 3;
ALERTS_Y = 20;
