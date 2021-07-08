moveX = 0;
moveY = 0;
moveDirection = 0;
moveMagnitude = 0;

runIsPressed = false;

anyKeyWasPressed = false;



var moveXInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var moveYInput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
if (point_distance(0, 0, moveXInput, moveYInput) > 0) {
	//TODO: Modify this section to fix the movement magnitude to a constant.
	moveDirection = point_direction(0, 0, moveXInput, moveYInput);
	moveX = moveXInput;
	moveY = moveYInput;
	moveMagnitude = point_distance(0, 0, moveX, moveY);
}

runIsPressed = keyboard_check(ord("J")) || keyboard_check(ord("K"));

anyKeyWasPressed = keyboard_check_pressed(vk_anykey);
