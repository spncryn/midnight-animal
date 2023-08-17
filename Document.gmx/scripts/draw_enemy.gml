///draw_enemy(legs, hp colour)
if path_index >= 0 and(alert >= 3 or alert = 0) angle = direction
if speed > 0 and alert = 0 angle = direction

// Draw shadow.
if light>0 light-=1
draw_set_blend_mode(bm_add)
draw_circle_color(x,y,32+random(6)+light,make_color_hsv(0,0,30),c_black,0)
draw_set_blend_mode(bm_normal)

// Draw legs.
if speed > 0 or path_index >= 0 or !scrIsSearching(sprite_index) draw_sprite_ext(argument0, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, 1)

// Draw body.
if eflash = true {
    draw_health(c_red)
    d3d_set_fog(true, c_white, 0, 0)
    draw_sprite_ext(sprite_index, image_index, x + irandom_range(-4.5,4.5), y + irandom_range(-4.5,4.5), image_xscale, left, angle, image_blend, image_alpha)
    d3d_set_fog(false, c_white, 0, 0)
} else {
    draw_health(argument1)
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, left, angle, c_black, 0.5)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, left, angle, image_blend, image_alpha)
}

//Draw vision cone
/*if alert > 0 {
    a = c_red
}else{
    a = c_green;
}
draw_set_alpha(.5);
draw_triangle_colour(x, y, x + lengthdir_x(global.dist_detection, angle - 30), y + lengthdir_y(global.dist_detection, angle - 30), x + lengthdir_x(global.dist_detection, angle + 30), y + lengthdir_y(global.dist_detection, angle + 30), a, a, a, false); 
draw_set_alpha(1);

