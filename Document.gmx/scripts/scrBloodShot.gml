//scrBloodShot(x, y, bullets)

repeat(1 + argument2) {
    my_id = instance_create(argument0, argument1, objSplat)
    my_id.direction = image_angle - 20 + random(40)
    my_id.speed = 2 + random(2)
    my_id.image_angle = random(360)
}

//my_id = instance_create(argument0 - 12 + random(24), argument1 - 12 + random(24), objBigBlood)
/*
repeat(1 + argument2) {
    my_id = instance_create(argument0, argument1, objSmudge)
    my_id.direction = image_angle - 20 + random(40)
    my_id.speed = 3 + random(3)
    my_id.image_angle = my_id.direction
}

/*
repeat(random(argument2)) {
    my_id = instance_create(argument0, argument1, objFleshChunk)
    my_id.direction = image_angle - 20 + random(40)
    my_id.speed = 3 + random(3)
    my_id.friction = 0.15
}

