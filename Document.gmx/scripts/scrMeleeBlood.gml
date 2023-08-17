repeat(2 + random(2)) {
    my_id = instance_create(argument0, argument1, objSplat)
    my_id.direction = random(360)
    my_id.speed = 2 + random(2)
}

repeat(2 + random(2)) {
    my_id = instance_create(argument0, argument1, objSmudge)
    my_id.direction = random(360)
    my_id.speed = 3 + random(3)
    my_id.image_angle = my_id.direction
}

repeat(2) my_id = instance_create(argument0 - 12 + random(24), argument1 - 12 + random(24), objBigBlood)

repeat(6) {
    my_id = instance_create(argument0, argument1, objFleshChunk)
    my_id.speed = 2 + random(1)
    my_id.direction = direction - 20 - random(40)
    my_id.image_angle = my_id.direction
}

// Amount of blood,
/*count = random_range(4, 32)

for (i = 0; i < count; i+=1) {

    // Spawn blood within an 8x8 square around the mouse cursor,
    instance_create(x + random_range(-8, 8), y + random_range(-8, 8), objSplatter)
}

/* Drop coins / money upon death.
if global.character = 18 {
    dropRate = random_range(6, 12)
    for (i=0; i < dropRate; i+=1) instance_create(x,y,objCoin)
}
*/
