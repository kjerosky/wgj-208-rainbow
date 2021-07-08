if (state == TitleState.INITIAL_WAIT && initialWaitFramesLeft <= 0) {
	state = TitleState.FADE_IN_MAIN_GRAPHICS;
} else if (state == TitleState.FADE_IN_MAIN_GRAPHICS && fadeInMainGraphicsFramesLeft <= 0) {
	state = TitleState.FADE_IN_ALL_TEXT;
} else if (state == TitleState.FADE_IN_ALL_TEXT && fadeInAllTextFramesLeft <= 0) {
	state = TitleState.ALLOW_PLAYER_INPUT;
} else if (state == TitleState.ALLOW_PLAYER_INPUT && oInput.menuSelectWasPressed) {
	state = TitleState.FADE_OUT;

	audio_play_sound(sndCrystalPickup, 0, false);
} else if (state == TitleState.FADE_OUT && fadeOutFramesLeft <= 0) {
	if (selectedMenuOption == 0) {
		room_goto_next();
	} else if (selectedMenuOption == 1) {
		game_end();
	}
}



switch (state) {
	case TitleState.INITIAL_WAIT: {
		initialWaitFramesLeft--;
	} break;

	case TitleState.FADE_IN_MAIN_GRAPHICS: {
		fadeInMainGraphicsFramesLeft--;
		allBlackAlpha = lerp(1, 0, 1 - fadeInMainGraphicsFramesLeft / TOTAL_FADE_IN_MAIN_GRAPHICS_FRAMES);
	} break;

	case TitleState.FADE_IN_ALL_TEXT: {
		fadeInAllTextFramesLeft--;
		allTextAlpha = lerp(0, 1, 1 - fadeInAllTextFramesLeft / TOTAL_FADE_IN_ALL_TEXT_FRAMES);
	} break;

	case TitleState.ALLOW_PLAYER_INPUT: {
		if (oInput.menuUpWasPressed) {
			audio_play_sound(sndMenuMove, 0, false);
			selectedMenuOption--;
			if (selectedMenuOption < 0) {
				selectedMenuOption = MENU_OPTIONS_SIZE - 1;
			}
		} else if (oInput.menuDownWasPressed) {
			audio_play_sound(sndMenuMove, 0, false);
			selectedMenuOption++;
			if (selectedMenuOption >= MENU_OPTIONS_SIZE) {
				selectedMenuOption = 0;
			}
		}
	} break;

	case TitleState.FADE_OUT: {
		fadeOutFramesLeft--;
		allBlackAlpha = lerp(0, 1, 1 - fadeOutFramesLeft / TOTAL_FADE_OUT_FRAMES);
	} break;

	default: {
		// do nothing
	}
}



redCrystalAngle += CRYSTAL_ROTATION_SPEED;
greenCrystalAngle += CRYSTAL_ROTATION_SPEED;
blueCrystalAngle += CRYSTAL_ROTATION_SPEED;

clockwise_shine_angle += CLOCKWISE_SHINE_ROTATION_SPEED;
counter_clockwise_shine_angle += COUNTER_CLOCKWISE_SHINE_ROTATION_SPEED;
