draw_set_halign(fa_left);
draw_set_valign(fa_top);

var displayTime = bankedTime;
if (timeTrackingState == TimeTrackingState.RUNNING) {
	displayTime += current_time - currentStartTime;
}
var timeText = "Time: " + convertMillisecondsToTimeString(displayTime);

draw_set_color(c_black);
draw_text(TIME_X - 1, TIME_Y - 1, timeText);
draw_text(TIME_X + 1, TIME_Y - 1, timeText);
draw_text(TIME_X - 1, TIME_Y + 1, timeText);
draw_text(TIME_X + 1, TIME_Y + 1, timeText);

draw_set_color(c_white);
draw_text(TIME_X, TIME_Y, timeText);



var alertsText = "Alerts: " + string(alerts);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(ALERTS_X - 1, ALERTS_Y - 1, alertsText);
draw_text(ALERTS_X + 1, ALERTS_Y - 1, alertsText);
draw_text(ALERTS_X - 1, ALERTS_Y + 1, alertsText);
draw_text(ALERTS_X + 1, ALERTS_Y + 1, alertsText);

draw_set_color(c_white);
draw_text(ALERTS_X, ALERTS_Y, alertsText);
