enum ControlState {
	PLAYER_NOT_DETECTED,
	START_ALARMING,
	ALARMING
};

state = ControlState.PLAYER_NOT_DETECTED;

TOTAL_CRYSTALS = CrystalType.LAST;
collectedCrystals = array_create(TOTAL_CRYSTALS);
for (var i = 0; i < TOTAL_CRYSTALS; i++) {
	collectedCrystals[i] = false;
}

areAllCrystalsCollected = false;

savePointX = oPlayer.x;
savePointY = oPlayer.y;
