draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var centerX = oCamera.VIEW_WIDTH / 2;

draw_set_color(c_white);
draw_text(centerX, oCamera.VIEW_HEIGHT / 3, "The power of the rainbow\nportal has sent you home!");

draw_set_color(c_yellow);
draw_text(centerX, oCamera.VIEW_HEIGHT * 2 / 3, "PRESS ANY KEY TO RETURN\nTO THE TITLE SCREEN");
