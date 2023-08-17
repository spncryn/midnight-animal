///scrGoreCut(x,y,dir,CreateIntestines)

repeat(1 + random(2)) {
    my_id = instance_create(argument0, argument1, objSplat)
    my_id.direction = random(360)
    my_id.speed = 2 + random(2)
}

repeat(1 + random(3)) {
    my_id = instance_create(argument0, argument1, objSmudge)
    my_id.direction = random(360)
    my_id.speed = 3 + random(3)
    my_id.image_angle = my_id.direction
}

my_id = instance_create(argument0 - 12 + random(24), argument1 - 12 + random(24), objBigBlood)

dir = argument2


repeat(4 + round(random(2))) {
    instance_create(argument0 - 7 + random(14), argument1 - 7 + random(14), objBloodSquirt)
}

if argument3 {
    repeat(6) {
        my_id = instance_create(argument0, argument1, objIntestine)
        my_id.speed = 1 + random(1)
        my_id.direction = argument2 - 20 - random(40)
        my_id.image_angle = my_id.direction
    }
}
