if (state != ControlState.ENTERING_PORTAL && state != ControlState.POST_PORTAL_WAIT) {
	exit;
}

var previousAlpha = draw_get_alpha();
draw_set_alpha(portalFlashAlpha);
draw_rectangle(0, 0, oCamera.VIEW_WIDTH, oCamera.VIEW_HEIGHT, false);
draw_set_alpha(previousAlpha);
