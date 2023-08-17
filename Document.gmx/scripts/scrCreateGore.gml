//Shotgun.
if sprite_index = sprEDeadShotgun{
    if (image_index = 0
    or image_index = 3
    or image_index = 4
    or image_index = 5
    or image_index = 7
    or image_index = 8
    or image_index = 9
    or image_index = 10)
    and bled = 0 {
        repeat(5 + random(5)) {
            my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objIntestine)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y)
            my_id.speed = 1.5 + random(1.5)
        }
        repeat(5 + random(5)) {
            my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objFleshChunk)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y)
            my_id.speed = 1.5 + random(1.5)
        }
        bled = 1
    }

    else if (image_index = 0 or image_index = 2) and bled = 0 {
        repeat(5 + random(5)) {
            my_id = instance_create(x - 3 + random(6), y - 3 + random(6), choose(objFleshChunkLarge, objFleshChunk))
            my_id.direction = point_direction(x, y, my_id.x, my_id.y)
            my_id.speed = 1.5 + random(1.5)
        }
        bled = 1
    }

    else if (image_index = 1 or image_index = 6) and bled = 0 {
        i = 0
        repeat(7) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objBrains)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 20 + random(40)
            my_id.speed = 2 + random(2)
        }
        repeat(3) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objHeadPiece)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 10 + random(20)
            my_id.speed = 1.5 + random(1.5)
            my_id.image_index = i
            i += 1
        }
        bled = 1
    }
}

if (sprite_index = sprEShotgunFly) and bled = 0 {
    repeat(5 + random(5)) {
        my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objIntestine)
        my_id.direction = point_direction(x, y, my_id.x, my_id.y)
        my_id.speed = 1.5 + random(1.5)
    }
    repeat(5 + random(5)) {
        my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objFleshChunk)
        my_id.direction = point_direction(x, y, my_id.x, my_id.y)
        my_id.speed = 1.5 + random(1.5)
    }
    bled = 1
}

//Rifle / pistol.
if sprite_index = sprEDeadMachinegun {
    if (image_index = 0 or image_index = 2 or image_index = 3 or image_index = 10) and bled = 0 {
        i = 0
        repeat(7) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objBrains)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 20 + random(40)
            my_id.speed = 2 + random(2)
        }
        repeat(3) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objHeadPiece)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 10 + random(20)
            my_id.speed = 1.5 + random(1.5)
            my_id.image_index = i
            i += 1
        }
        bled = 1
    }
}


//Blunt.
if sprite_index = sprEDeadBlunt {
    if (image_index = 0 or image_index = 3 or image_index = 6 or image_index = 9) and bled = 0 {
        i = 0
        repeat(7) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objBrains)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 20 + random(40)
            my_id.speed = 2 + random(2)
        }
        repeat(3) {
            my_id = instance_create(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), objHeadPiece)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y) - 10 + random(20)
            my_id.speed = 1.5 + random(1.5)
            my_id.image_index = i
            i += 1
        }
        bled = 1
    }
}

//Cut.
if sprite_index = sprEDeadCut {
    if (image_index = 8 or image_index = 9 or image_index = 10) and bled = 0 {
        repeat(5 + random(5)) {
            my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objIntestine)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y)
            my_id.speed = 1.5 + random(1.5)
        }
        repeat(5 + random(5)) {
            my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objFleshChunk)
            my_id.direction = point_direction(x, y, my_id.x, my_id.y)
            my_id.speed = 1.5 + random(1.5)
        }
        bled = 1
        bled = 1
    }
}
