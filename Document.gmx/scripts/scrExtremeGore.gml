repeat(4 + random(4)) {
    my_id = instance_create(argument0, argument1, objSplat)
    my_id.direction = random(360)
    my_id.speed = 2 + random(2)
}

repeat(4 + random(5)) {
    my_id = instance_create(argument0, argument1, objSmudge)
    my_id.direction = random(360)
    my_id.speed = 3 + random(3)
    my_id.image_angle = my_id.direction
}

repeat(2 + random(2)) {
    my_id = instance_create(argument0 - 12 + random(24), argument1 - 12 + random(24), objBigBlood)
}

dir = random(360)

repeat(6) {
    my_id = instance_create(argument0, argument1, objFleshChunk)
    my_id.speed = 1 + random(1)
    my_id.direction = random(360) - 20 - random(40)
    my_id.image_angle = my_id.direction
}

