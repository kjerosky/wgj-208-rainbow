draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var centerX = oCamera.VIEW_WIDTH / 2;
var centerY = oCamera.VIEW_HEIGHT / 2;

draw_set_color(c_white);
draw_text(centerX, oCamera.VIEW_HEIGHT / 4, "The power of the rainbow\nportal has sent you home!");

var statsValuesText = convertMillisecondsToTimeString(global.time) + "\n" + string(global.alerts);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(centerX, centerY, "Time: \nAlerts: ");
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(centerX, centerY, statsValuesText);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_yellow);
draw_text(centerX, oCamera.VIEW_HEIGHT * 3 / 4, "PRESS ANY KEY TO RETURN\nTO THE TITLE SCREEN");
