enum TitleState {
	INITIAL_WAIT,
	FADE_IN_MAIN_GRAPHICS,
	FADE_IN_ALL_TEXT,
	ALLOW_PLAYER_INPUT,
	FADE_OUT,
	SHOW_CREDITS
};

state = TitleState.INITIAL_WAIT;

CRYSTAL_RADIUS = 40;
CRYSTAL_ROTATION_SPEED = -0.5;
redCrystalAngle = 0;
greenCrystalAngle = 120;
blueCrystalAngle = 240;

CLOCKWISE_SHINE_ROTATION_SPEED = -1;
clockwise_shine_angle = 0;

COUNTER_CLOCKWISE_SHINE_ROTATION_SPEED = -CLOCKWISE_SHINE_ROTATION_SPEED / 3;
counter_clockwise_shine_angle = 0;

TOTAL_INITIAL_WAIT_FRAMES = 60;
initialWaitFramesLeft = TOTAL_INITIAL_WAIT_FRAMES;
allBlackAlpha = 1;

TOTAL_FADE_IN_MAIN_GRAPHICS_FRAMES = 60;
fadeInMainGraphicsFramesLeft = TOTAL_FADE_IN_MAIN_GRAPHICS_FRAMES;

TOTAL_FADE_IN_ALL_TEXT_FRAMES = 60;
fadeInAllTextFramesLeft = TOTAL_FADE_IN_ALL_TEXT_FRAMES
allTextAlpha = 0;

TOTAL_FADE_OUT_FRAMES = 60;
fadeOutFramesLeft = TOTAL_FADE_OUT_FRAMES;

MENU_OPTIONS = [
	"START GAME",
	"CREDITS",
	"EXIT"
];
MENU_OPTIONS_SIZE = array_length(MENU_OPTIONS);
MENU_OPTIONS_SPACING = 18;
selectedMenuOption = 0;

MAIN_GRAPHIC_CENTER_X = oCamera.VIEW_WIDTH / 2;
MAIN_GRAPHIC_CENTER_Y = oCamera.VIEW_HEIGHT / 2 - 10;

startingToShowCredits = false;
