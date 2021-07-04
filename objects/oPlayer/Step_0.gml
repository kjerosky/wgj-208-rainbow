var moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var moveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));
x += moveX;
y += moveY;

var lastSprite = sprite_index;
if (moveX != 0) {
	sprite_index = sPlayerWalking;
	facingDirection = moveX < 0 ? 2 : 0;
} else if (moveY != 0) {
	sprite_index = sPlayerWalking;
	facingDirection = moveY < 0 ? 1 : 3;
} else {
	sprite_index = sPlayerIdle;
}

if (lastSprite != sprite_index) {
	localFrame = 0;
}

var totalFrames = sprite_get_number(sprite_index) / 4;
image_index = (facingDirection * totalFrames) + localFrame;


localFrame += sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
if (localFrame >= totalFrames) {
	localFrame -= totalFrames;
}
