/// Create blood trail.
image_angle += speed * diradd * 2

if bled <= 20 {
    bled += 1 
    if irandom(40) = 2 instance_create(x, y, objSplat)
}

if speed > 0 {
    surface_set_target(objSurfacer.surf)
    repeat(4) {
        dir = random(360)
        length = random(4)
        myx = x + lengthdir_x(length, dir)
        myy = y + lengthdir_y(length, dir)
        draw_sprite_ext(sprBloodSpeck, random(10), myx * 2, myy * 2, 2, 2, dir, merge_color(c_red,c_maroon,0.7), 0.8)
    }
    surface_reset_target()
}
