areAllCrystalsCollected = true;
for (var i = 0; i < TOTAL_CRYSTALS; i++) {
	if (!collectedCrystals[i]) {
		areAllCrystalsCollected = false;
		break;
	}
}
