draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var centerX = oCamera.VIEW_WIDTH / 2;

var previousAlpha = draw_get_alpha();

draw_set_alpha(mainTextAlpha);
draw_set_color(c_white);
draw_text(centerX, oCamera.VIEW_HEIGHT / 3, "You are lost and far from home.\nYou need to get back the RGB\nCrystals stolen from you in order to\ncreate a rainbow portal and return.");

draw_set_alpha(playerPromptAlpha);
draw_set_color(c_yellow);
draw_text(centerX, oCamera.VIEW_HEIGHT * 2 / 3, "PRESS ANY KEY TO BEGIN");

draw_set_alpha(previousAlpha);
