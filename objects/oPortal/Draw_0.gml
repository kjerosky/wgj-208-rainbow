if (showRed) {
	draw_sprite(sPortalRed, -1, x, y);
}

if (showGreen) {
	draw_sprite(sPortalGreen, -1, x, y);
}

if (showBlue) {
	draw_sprite(sPortalBlue, -1, x, y);
}

if (showYellow) {
	draw_sprite(sPortalYellow, -1, x, y);
}

if (showCyan) {
	draw_sprite(sPortalCyan, -1, x, y);
}

if (showMagenta) {
	draw_sprite(sPortalMagenta, -1, x, y);
}

if (middleColor != noone) {
	draw_sprite_ext(sPortalWhite, -1, x, y, 1, 1, 0, middleColor, 1);
}

draw_sprite(sPortalMain, -1, x, y);

if (oGameState.areAllCrystalsCollected) {
	draw_sprite_ext(sPortalShine, -1, x, y, 1, 1, shineRotationAngle, c_white, 1);
	draw_sprite_ext(sPortalShine, -1, x, y, 1, 1, -shineRotationAngle / 3, c_white, 1);
}
