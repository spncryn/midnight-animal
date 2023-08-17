//scrBloodShot(x,y,bullets,direction)

repeat(3 + argument2) {
    my_id = instance_create(argument0, argument1, objSplat)
    my_id.direction = random(360)
    my_id.speed = 2 + random(2)
}
repeat(3 + argument2) {
    my_id = instance_create(argument0, argument1, objSmudge)
    my_id.direction = argument3 - 20 + random(40)
    my_id.speed = 3 + random(3)
    my_id.image_angle = my_id.direction
}
repeat(1 + argument2) {
        my_id = instance_create(argument0 - 12 + random(24), argument1 - 12 + random(24), objBigBlood)
    }

// Amount of blood,
/*count = random_range(4, 32)

for (i = 0; i < count; i+=1) {

    // Spawn blood within an 8x8 square around the mouse cursor,
    instance_create(x + random_range(-8, 8), y + random_range(-8, 8), objSplatter)
}

