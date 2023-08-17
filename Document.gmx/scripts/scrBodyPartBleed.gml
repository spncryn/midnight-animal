if image_index = 0 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(4, image_angle - 180) - 4 + random(8), y + lengthdir_y(4, image_angle - 180) - 4 + random(8), objBloodSquirt)
        my_id.image_angle = image_angle - 180 - 10 + random(20)
    }
}

if image_index = 1 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(5, image_angle) - 4 + random(8), y + lengthdir_y(5, image_angle) - 4 + random(8), objBloodSquirt)
        my_id.image_angle = image_angle - 10 + random(20)
    }
}

if image_index = 2 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(6, image_angle - 180) - 4 + random(8), y + lengthdir_y(6, image_angle - 180) - 4 + random(8), objBloodSquirt)
        my_id.image_angle = image_angle - 180 - 10 + random(20)
    }
}

if image_index = 3 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(3, image_angle) - 4 + random(8), y + lengthdir_y(3, image_angle) - 4 + random(8), objBloodSquirt)
        my_id.image_angle = image_angle - 10 + random(20)
    }
}

if image_index = 4 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(11, image_angle + 20 * image_yscale) - 1 + random(2), y + lengthdir_y(11, image_angle + 20 * image_yscale) - 1 + random(2), objBloodSquirt)
        my_id.image_angle = image_angle + 45 * image_yscale - 20 + random(40)
    }
}

if image_index = 7 {
    repeat(1 + random(3)) {
        my_id = instance_create(x + lengthdir_x(13, image_angle), y + lengthdir_y(13, image_angle), objBloodSquirt)
        my_id.image_angle = image_angle - 12 + random(24)
    }
}

