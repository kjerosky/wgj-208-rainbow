if (state == IntroTextState.WAIT_TO_FADE_IN_MAIN_TEXT && waitToFadeInMainTextFramesLeft <= 0) {
	state = IntroTextState.FADE_IN_MAIN_TEXT;
} else if (state == IntroTextState.FADE_IN_MAIN_TEXT && fadeInMainTextFramesLeft <= 0) {
	state = IntroTextState.FADE_IN_PLAYER_PROMPT;
} else if (state == IntroTextState.FADE_IN_PLAYER_PROMPT && fadeInPlayerPromptFramesLeft <= 0) {
	state = IntroTextState.AWAITING_PLAYER_INPUT;
} else if (state == IntroTextState.AWAITING_PLAYER_INPUT && oInput.anyKeyWasPressed) {
	state = IntroTextState.FADE_OUT;
} else if (state == IntroTextState.FADE_OUT && fadeOutFramesLeft <= 0) {
	room_goto_next();
}

switch (state) {
	case IntroTextState.WAIT_TO_FADE_IN_MAIN_TEXT: {
		waitToFadeInMainTextFramesLeft--;
	} break;

	case IntroTextState.FADE_IN_MAIN_TEXT: {
		fadeInMainTextFramesLeft--;
		mainTextAlpha = lerp(0, 1, 1 - fadeInMainTextFramesLeft / TOTAL_FADE_IN_MAIN_TEXT_FRAMES);
	} break;

	case IntroTextState.FADE_IN_PLAYER_PROMPT: {
		fadeInPlayerPromptFramesLeft--;
		playerPromptAlpha = lerp(0, 1, 1 - fadeInPlayerPromptFramesLeft / TOTAL_FADE_IN_PLAYER_PROMPT_FRAMES);
	} break;

	case IntroTextState.FADE_OUT: {
		fadeOutFramesLeft--;
		mainTextAlpha = lerp(1, 0, 1 - fadeOutFramesLeft / TOTAL_FADE_OUT_FRAMES);
		playerPromptAlpha = mainTextAlpha;
	} break;

	default: {
		// do nothing
	}
}
