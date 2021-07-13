var previousAlpha = draw_get_alpha();

var centerX = oCamera.VIEW_WIDTH / 2;

if (state == ControlState.ENTERING_PORTAL || state == ControlState.POST_PORTAL_WAIT) {
	draw_set_color(c_white);
	draw_set_alpha(portalFlashAlpha);
	draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);
} else if (state == ControlState.PAUSED) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);

	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(centerX, oCamera.VIEW_HEIGHT / 3, "PAUSED");

	for (var i = 0; i < MENU_OPTIONS_SIZE; i++) {
		var isSelectedMenuOption = i == selectedMenuOption;
		var menuOptionColor = isSelectedMenuOption ? c_yellow : c_white;
		var menuOptionText = isSelectedMenuOption ? "< " + MENU_OPTIONS[i] + " >" : MENU_OPTIONS[i];

		draw_set_color(menuOptionColor);
		draw_text(centerX, oCamera.VIEW_HEIGHT / 2 + MENU_OPTIONS_SPACING * i, menuOptionText);
	}
}

draw_set_alpha(previousAlpha);
