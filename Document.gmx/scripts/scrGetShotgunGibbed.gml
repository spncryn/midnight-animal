my_id.sprite_index = sprEDeadShotgunBlastBottom
my_id.speed = 1.5 + random(2) + bullets * 0.15
if my_id.speed > 4.5 my_id.speed = 4.5
my_id.direction = edir - 10 + random(20)
my_id.image_angle = my_id.direction
my_id.friction = 0.15
my_id.image_index = floor(random(sprite_get_number(my_id.sprite_index)))

// Dismembered legs.
if my_id.image_index = 0
or my_id.image_index = 1 {
    scrMeleeBlood(x, y)
    part = instance_create(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir), objBodyPart)
    part.sprite_index = sprELimbs
    part.direction = edir - 10 + random(20)
    part.speed = 2 + random(1)
    part.friction = 0.15
    part.image_index = choose(0, 1, 2)
    part.alarm[0] = 6
    part.image_angle = part.direction
    part.image_yscale = choose(0, 1)
}

// Dismembered arms.
if my_id.image_index = 2
or my_id.image_index = 3
or my_id.image_index = 4
or my_id.image_index = 5 {
    scrMeleeBlood(x, y)
    part = instance_create(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir), objBodyPart)
    part.sprite_index = sprELimbs
    part.direction = edir - 10 + random(20) //point_direction(objPlayer.x, objPlayer.y, x, y) - 45
    part.speed = 2 + random(1)
    part.friction = 0.15
    part.image_index = choose(3, 4)
    part.alarm[0] = 6
    part.image_angle = part.direction
    part.image_yscale = choose(0, 1)
}

create_points("GIBBED +100")
