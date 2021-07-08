var centerX = oCamera.VIEW_WIDTH / 2;

var previousAlpha = draw_get_alpha();

draw_sprite_ext(sPortalShine, -1, MAIN_GRAPHIC_CENTER_X, MAIN_GRAPHIC_CENTER_Y, 1, 1, clockwise_shine_angle, c_white, 1);
draw_sprite_ext(sPortalShine, -1, MAIN_GRAPHIC_CENTER_X, MAIN_GRAPHIC_CENTER_Y, 1, 1, counter_clockwise_shine_angle, c_white, 1);

var redCrystalX = MAIN_GRAPHIC_CENTER_X + CRYSTAL_RADIUS * dcos(redCrystalAngle);
var redCrystalY = MAIN_GRAPHIC_CENTER_Y + CRYSTAL_RADIUS * dsin(redCrystalAngle);
draw_sprite_ext(sCrystalUncolored, -1, redCrystalX, redCrystalY, 1, 1, 0, c_red, 1);

var greenCrystalX = MAIN_GRAPHIC_CENTER_X + CRYSTAL_RADIUS * dcos(greenCrystalAngle);
var greenCrystalY = MAIN_GRAPHIC_CENTER_Y + CRYSTAL_RADIUS * dsin(greenCrystalAngle);
draw_sprite_ext(sCrystalUncolored, -1, greenCrystalX, greenCrystalY, 1, 1, 0, c_lime, 1);

var blueCrystalX = MAIN_GRAPHIC_CENTER_X + CRYSTAL_RADIUS * dcos(blueCrystalAngle);
var blueCrystalY = MAIN_GRAPHIC_CENTER_Y + CRYSTAL_RADIUS * dsin(blueCrystalAngle);
draw_sprite_ext(sCrystalUncolored, -1, blueCrystalX, blueCrystalY, 1, 1, 0, c_blue, 1);

draw_set_alpha(allTextAlpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var gameNameColor = make_color_hsv(gameNameHue, 255, 255);
draw_set_color(gameNameColor);
draw_text(centerX, 20, "HOMEWARD HUES");

for (var i = 0; i < MENU_OPTIONS_SIZE; i++) {
	var isSelectedMenuOption = i == selectedMenuOption;
	var menuOptionColor = isSelectedMenuOption ? c_yellow : c_white;
	var menuOptionText = isSelectedMenuOption ? "< " + MENU_OPTIONS[i] + " >" : MENU_OPTIONS[i];

	draw_set_color(menuOptionColor);
	draw_text(centerX, 140 + MENU_OPTIONS_SPACING * i, menuOptionText);
}

draw_set_alpha(allBlackAlpha);
draw_set_color(c_black);
draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);

if (state == TitleState.SHOW_CREDITS) {
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);

	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(0, 0,
		"\"Homeward Hues\" by Keith Jerosky\n" +
		"Submission to WeeklyGameJam Week 208\n" +
		"July 8, 2021\n" +
		"\n" +
		"Title Screen Music:\n" +
		"Synapse by Shane Ivers\n" +
		"https://www.silvermansound.com\n" +
		"\n" +
		"Main Game Music:\n" +
		"Big Boi Pants by Shane Ivers\n" +
		"https://www.silvermansound.com"
	);
}

draw_set_alpha(previousAlpha);
