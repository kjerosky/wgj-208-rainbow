showRed = oGameState.collectedCrystals[CrystalType.RED];
showGreen = oGameState.collectedCrystals[CrystalType.GREEN];
showBlue = oGameState.collectedCrystals[CrystalType.BLUE];

showYellow = showRed && showGreen;
showCyan = showGreen && showBlue;
showMagenta = showRed && showBlue;

middleColor = noone;
if (showRed && showGreen && showBlue) {
	middleColor = c_white;
} else if (showYellow) {
	middleColor = c_yellow;
} else if (showCyan) {
	middleColor = c_aqua;
} else if (showMagenta) {
	middleColor = c_fuchsia;
}
