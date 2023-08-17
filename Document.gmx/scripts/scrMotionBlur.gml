//scrMotionBlur(speed,direction,x,y)

var len, dir, xp, yp, rot, i, quality, rotorig;

len = argument0
dir = argument1
xp = argument2
yp = argument3
rot = 0
rotorig = rot
if rot < 0 rot *= -1

if len > 0 or rot > 0 {
    quality = 1
    len /= quality
    rot /= quality * 2
    rotorig /= quality * 2

    var lenx, leny, times, rotinc;

    times = rot
    if len > times times = len

    lenx = 0
    leny = 0
    if len > 0 {
        lenx = lengthdir_x(len / times * quality, dir)
        leny = lengthdir_y(len / times * quality, dir)
    }

    rotinc = rotorig / times * 2 * quality

    for (i = times; i > 0; i -= 1) {
        draw_sprite_ext(sprite_index, image_index, xp + i * lenx, yp + i * leny, image_xscale, image_yscale, image_angle + rotinc * i, image_blend, 0.5 / (times / 2))
    }
} else draw_sprite_ext(sprite_index, image_index, xp, yp, image_xscale, image_yscale, image_angle, image_blend,0.5)

