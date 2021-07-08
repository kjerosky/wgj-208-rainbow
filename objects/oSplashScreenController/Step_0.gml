if (state == SplashScreenState.WAIT && waitFramesLeft <= 0) {
	state = SplashScreenState.FADE_IN;
} else if (state == SplashScreenState.FADE_IN && fadeInFramesLeft <= 0) {
	state = SplashScreenState.PLAYING_MUSIC;
	
	audio_play_sound(sndWgjDitty, 10, false);
} else if (state == SplashScreenState.PLAYING_MUSIC && !audio_is_playing(sndWgjDitty)) {
	state = SplashScreenState.FADE_OUT;
} else if (state == SplashScreenState.FADE_OUT && fadeOutFramesLeft <= 0) {
	room_goto_next();
}



switch (state) {
	case SplashScreenState.WAIT: {
		waitFramesLeft--;
	} break;

	case SplashScreenState.FADE_IN: {
		fadeInFramesLeft--;
		allBlackAlpha = lerp(1, 0, 1 - fadeInFramesLeft / TOTAL_FADE_IN_FRAMES);
	} break;

	case SplashScreenState.FADE_OUT: {
		fadeOutFramesLeft--;
		allBlackAlpha = lerp(0, 1, 1 - fadeOutFramesLeft / TOTAL_FADE_OUT_FRAMES);
	} break;

	default: {
		// do nothing
	}
}
