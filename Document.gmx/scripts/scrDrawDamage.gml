if !instance_exists(objPlayer) exit

/*if objPlayer.hp < objPlayer.max_hp {

    if killamount < objPlayer.hp * 0.05 killamount = objPlayer.hp * 0.05
    if killamount > 0.5 killamount = 0.5
}*/
killamount = objPlayer.hp / objPlayer.max_hp

var alpha;
alpha = killamount
draw_set_blend_mode(bm_subtract)
draw_circle_color(display_get_gui_width() / 2, display_get_gui_height() / 2, display_get_gui_width() * 0.75, c_black, merge_color(c_aqua, c_black, alpha), 0)
draw_set_blend_mode(bm_add)
myx = -random(32)
myy = -random(32)
draw_sprite_stretched_ext(sprNoise, 0, myx, myy, display_get_gui_width(), display_get_gui_height(), merge_color(c_white, c_black, alpha), 1)
draw_reset()

//if instance_exists(efDesaturation) efDesaturation.var_greyscale_fade += killamount

/*if objPlayer.hp <= 20 {

    //draw_set_alpha(0.3)
    //draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), global.rubedo, global.rubedo, global.rubedo, global.rubedo, 0)
    //draw_set_alpha(1)

    draw_sprite_stretched_ext(sprDirtyFilter, 0, 0, 0, view_wview, view_hview, c_white, 1)

    draw_set_blend_mode(bm_add)
    myx = -random(32)
    myy = -random(32)
    draw_sprite_stretched_ext(sprNoise, 0, myx, myy, display_get_gui_width(), display_get_gui_height(), merge_color(c_black, c_white, 0.2), 1)
    draw_set_blend_mode(bm_normal)

    draw_sprite_stretched_ext(sprScanlines, animate, 0, 0, view_wview, view_hview, c_white, 1)
    animate += 0.8

    if round(random(10)) = 2 {
        t = 2 + floor(random(8))
        if t < brus brus = t
    }

    if instance_exists(efDesaturation) efDesaturation.var_greyscale_fade = 1
} */

//if objPlayer.hp = 0 efDesaturation.var_greyscale_fade = 0.7
