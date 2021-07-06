enum PlayerState {
	IDLE,
	MOVING
};

state = PlayerState.IDLE;
sprite_index = sPlayerIdle;
localFrame = 0;

TOTAL_SPRITE_FACING_DIRECTIONS = 4;
facingOctant = 6;
octantRightOfFacingOctant = 5;
octantLeftOfFacingOctant = 7;

WALKING_SPEED = 1;
RUNNING_SPEED = 2;
