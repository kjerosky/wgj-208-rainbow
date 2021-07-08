var previousAlpha = draw_get_alpha();

var centerX = oCamera.VIEW_WIDTH / 2;
var centerY = oCamera.VIEW_HEIGHT / 2;
draw_sprite(sWgjLogo, -1, centerX, centerY);

draw_set_color(c_white);
draw_set_halign(fa_center);

draw_set_valign(fa_bottom);
draw_text(centerX, centerY - sprite_get_height(sWgjLogo) / 2 - 10, "WeeklyGameJam - Week 208");

draw_set_valign(fa_top);
draw_text(centerX, centerY + sprite_get_height(sWgjLogo) / 2 + 10, "Submission by\nKeith Jerosky");

draw_set_alpha(allBlackAlpha);
draw_set_color(c_black);
draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);

draw_set_alpha(previousAlpha);
