if (timeTrackingState == TimeTrackingState.RUNNING) {
	bankedTime += current_time - currentStartTime;
}

global.alerts = alerts;
global.time = bankedTime;
