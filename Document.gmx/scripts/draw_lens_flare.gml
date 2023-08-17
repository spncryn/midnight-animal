///Lens flare by Esteban Devia

//draw_lens_flare(x,y,Radius,SizeX,SizeY,RingSize,Transparency,GlowOpacity)

var xx, yy, alpha, LightSize, Size_x, size_y, RingSize, Opacity, LensDir;

xx = argument0
yy = argument1

//Set the radius of the light.
LightSize = argument2

//Set the size of the light flare.
Size_x = argument3
Size_y = argument4
RingSize = argument5
//This Opacity is how transparent is the light (as higher the number is, the transparent the light is)
Opacity = argument6
GlowOpacity = argument7

//Set additive blending mode.
draw_set_blend_mode(bm_add)

//Get the centre of the screen.
var center_x, center_y;
if view_enabled = 1 {
    center_x = view_xview + (view_wview / 2)
    center_y = view_yview + (view_hview / 2)

    //Don't draw the light if too far.
    if point_distance(xx, yy, center_x, center_y) > view_hview * 1.5 {
        draw_set_blend_mode(bm_normal)
        exit;
    }
}
else {
    center_x = view_xview[0] / 2
    center_y = view_yview[0] / 2
}


//Fetch direction of lens flare.
LensDir = point_direction(xx, yy, center_x, center_y)

//Draw lens flare.
//Each line is an image

//Set alpha.
alpha = (1 - (point_distance(xx, yy, center_x, center_y) / LightSize)) / (Opacity)

//Draw iris.
draw_sprite_ext(sprLFIris, 1, -xx + (center_x * 2), -yy + (center_y * 2), Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * .5), Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * .5), direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFIris, 0, -((xx - center_x) * .5) + center_x, -((yy - center_y) * .5) + center_y, Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .02, Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .02, direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFIris, 0, -((xx - center_x) * .8) + center_x, -((yy - center_y) * .8) + center_y, Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .06, Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .06, direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFIris, 0, -((xx - center_x) * .2) + center_x, -((yy - center_y) * .2) + center_y, Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .15, Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .15, direction, draw_get_color(), alpha)

draw_sprite_ext(sprLFIris, 0, ((xx - center_x) * .2) + center_x, ((yy - center_y) * .2) + center_y, Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .007, Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .007, direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFIris, 1, ((xx - center_x) * .5) + center_x, ((yy - center_y) * .5) + center_y, Size_x * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .02, Size_y * point_distance(xx, yy, center_x, center_y) / ((center_x * 2) * 2) + .02, direction, draw_get_color(), alpha)


draw_sprite_ext(sprLFIris, 2, -((xx - center_x) * 1.6) + center_x, -((yy - center_y) * 1.6) + center_y, Size_x * .3, Size_y * .3, direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFIris, 2, -((xx - center_x) * 2) + center_x, -((yy - center_y) * 2) + center_y, Size_x * .4, Size_y * .4, direction, draw_get_color(), alpha)
draw_sprite_ext(sprLFGlow, 0, ((xx - center_x) * .4) + center_x, ((yy - center_y) * .4) + center_y, Size_x * .4, Size_y * .4, direction, draw_get_color(), alpha)

//Draw ring.
draw_sprite_ext(sprLFRing, 0, center_x, center_y, RingSize * point_distance(center_x, center_y, xx, yy) / (view_wview / 2), RingSize * point_distance(center_x, center_y, xx, yy) / (view_wview / 2), LensDir, -1, alpha)

//Draw glow.
draw_sprite_ext(sprLFGlow, 0, xx, yy, Size_x * 1, Size_y * 1, 0, draw_get_color(), GlowOpacity)

//Reset blending mode.
draw_set_blend_mode(bm_normal)

