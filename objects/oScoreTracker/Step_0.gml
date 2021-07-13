if (timeTrackingState == TimeTrackingState.SIGNAL_RUNNING) {
	timeTrackingState = TimeTrackingState.RUNNING;
	
	currentStartTime = current_time;
} else if (timeTrackingState == TimeTrackingState.SIGNAL_PAUSED) {
	timeTrackingState = TimeTrackingState.PAUSED;
	
	bankedTime += current_time - currentStartTime;
}
