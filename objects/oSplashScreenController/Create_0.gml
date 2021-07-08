enum SplashScreenState {
	WAIT,
	FADE_IN,
	PLAYING_MUSIC,
	FADE_OUT
};

state = SplashScreenState.WAIT;

waitFramesLeft = 60;

TOTAL_FADE_IN_FRAMES = 60;
fadeInFramesLeft = TOTAL_FADE_IN_FRAMES;
allBlackAlpha = 1;

TOTAL_FADE_OUT_FRAMES = 60;
fadeOutFramesLeft = TOTAL_FADE_OUT_FRAMES;
