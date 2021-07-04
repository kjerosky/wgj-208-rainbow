// We position the camera in the end step event because we should do so after all
// movement has completed.

#macro view view_camera[0]

camera_set_view_size(view, VIEW_WIDTH, VIEW_HEIGHT);

if (!instance_exists(oPlayer)) {
	exit;
}

var targetViewX = clamp(oPlayer.x - VIEW_WIDTH / 2, 0, room_width - VIEW_WIDTH);
var targetViewY = clamp(oPlayer.y - VIEW_HEIGHT / 2, 0, room_height - VIEW_HEIGHT);
camera_set_view_pos(view, targetViewX, targetViewY);
