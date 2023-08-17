// Draw shadow.
if !instance_exists(objSunset) draw_sprite_ext(sprShadow, 0, x, y, 0.5, 0.5, 0, c_black, 1)

// Draw legs.
if speed > 0 draw_sprite_ext(argument0, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, 1)

angle=direction
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha)
