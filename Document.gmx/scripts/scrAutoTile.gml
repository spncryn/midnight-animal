var dst, obj, up, down, left, right;

dst = 8
obj = object_index
up = place_meeting(x, y - dst, obj)
down = place_meeting(x, y + dst, obj)
left = place_meeting(x - dst, y, obj)
right = place_meeting(x + dst, y, obj)

image_speed = 0
image_index = (8 * down) + (4 * left) + (2 * up) + right

