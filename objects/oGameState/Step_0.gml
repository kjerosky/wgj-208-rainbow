var alarmIsSounding = audio_is_playing(sndDetectedAlarm);

if (state == ControlState.START_ALARMING) {
	state = ControlState.ALARMING;

	audio_play_sound(sndDetectedAlarm, 0, false);
} else if (state == ControlState.ALARMING && !alarmIsSounding) {
	state = ControlState.PLAYER_NOT_DETECTED;

	oPlayer.x = savePointX;
	oPlayer.y = savePointY;
} else if (state == ControlState.START_ENTERING_PORTAL) {
	state = ControlState.ENTERING_PORTAL;

	enteringPortalFramesLeft = TOTAL_ENTERING_PORTAL_FRAMES;
} else if (state == ControlState.ENTERING_PORTAL && enteringPortalFramesLeft <= 0) {
	state = ControlState.POST_PORTAL_WAIT;

	postPortalWaitFramesLeft = TOTAL_POST_PORTAL_WAIT_FRAMES;
} else if (state == ControlState.POST_PORTAL_WAIT && postPortalWaitFramesLeft <= 0) {
	//TODO
	game_end();
}



switch (state) {
	case ControlState.ENTERING_PORTAL: {
		enteringPortalFramesLeft--;
		portalFlashAlpha = lerp(0, 1, 1 - enteringPortalFramesLeft / TOTAL_ENTERING_PORTAL_FRAMES);
	} break;

	case ControlState.POST_PORTAL_WAIT: {
		postPortalWaitFramesLeft--;
	} break;

	default: {
		// do nothing
	}
}



areAllCrystalsCollected = true;
for (var i = 0; i < TOTAL_CRYSTALS; i++) {
	if (!collectedCrystals[i]) {
		areAllCrystalsCollected = false;
		break;
	}
}
