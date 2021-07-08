enum ControlState {
	PLAYER_NOT_DETECTED,
	START_ALARMING,
	ALARMING,
	START_ENTERING_PORTAL,
	ENTERING_PORTAL,
	POST_PORTAL_WAIT,
	PAUSED
};

state = ControlState.PLAYER_NOT_DETECTED;
previousState = noone;

TOTAL_CRYSTALS = CrystalType.LAST;
collectedCrystals = array_create(TOTAL_CRYSTALS);
for (var i = 0; i < TOTAL_CRYSTALS; i++) {
	collectedCrystals[i] = false;
}

areAllCrystalsCollected = false;

savePointX = oPlayer.x;
savePointY = oPlayer.y;

TOTAL_ENTERING_PORTAL_FRAMES = 120;
enteringPortalFramesLeft = 0;
portalFlashAlpha = 0;

TOTAL_POST_PORTAL_WAIT_FRAMES = 60;
postPortalWaitFramesLeft = 0;

MENU_OPTIONS = [
	"RETURN TO GAME",
	"GO TO TITLE SCREEN"
];
MENU_OPTIONS_SIZE = array_length(MENU_OPTIONS);
MENU_OPTIONS_SPACING = 18;
selectedMenuOption = 0;

audio_play_sound(musMain, 0, true);
