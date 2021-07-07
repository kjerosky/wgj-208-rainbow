var alarmIsSounding = audio_is_playing(sndDetectedAlarm);

if (state == ControlState.START_ALARMING) {
	state = ControlState.ALARMING;

	audio_play_sound(sndDetectedAlarm, 0, false);
} else if (state == ControlState.ALARMING && !alarmIsSounding) {
	state = ControlState.PLAYER_NOT_DETECTED;

	oPlayer.x = savePointX;
	oPlayer.y = savePointY;
}



areAllCrystalsCollected = true;
for (var i = 0; i < TOTAL_CRYSTALS; i++) {
	if (!collectedCrystals[i]) {
		areAllCrystalsCollected = false;
		break;
	}
}
