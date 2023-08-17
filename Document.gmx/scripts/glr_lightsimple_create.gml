///glr_lightsimple_create(sprite, subimg, x, y, color, alpha, intensity)


/*
    <=============== DESCRIPTION ===============>
        Creates a simple light.
        
        Simple lights do not casts shadows!
        So they are much faster than normal
        lights.
        
        Useful when you don't need shadows
        in certain areas of your game
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite mask of the light
        subimg: the subimage of the sprite
        x: the x position
        y: the y position
        color: the color of the light
        alpha: the transparency of the light
        intensity: the brightness from 0 to 1
        
        NB: the intensity value is only active
        if you use glr_draw_gamma(...)
        and NOT glr_draw(...)
            
    <================  EXAMPLE  ================>
        light = glr_lightsimple_create(spr_light_mask_point, 0, x, y, c_white, 1, 0.5);
    <===========================================>
*/

var l = ds_list_create();
 

l[| GLR_LIGHT.active] = true; //active

//transform
l[| GLR_LIGHT.px] = argument2;  //x
l[| GLR_LIGHT.py] = argument3;  //y
l[| GLR_LIGHT.rotation] = 0;  //rotation
l[| GLR_LIGHT.xscale] = 1;  //xscale
l[| GLR_LIGHT.yscale] = 1;  //yscale

l[| GLR_LIGHT.type] = GLR_TYPE.lightsimple;

//light info
l[| GLR_LIGHT.color] = argument4;  //[6]color
l[| GLR_LIGHT.alpha] = argument5;  //alpha
l[| GLR_LIGHT.intensity] = max(0, argument6);  //intensity
l[| GLR_LIGHT.sprite] = argument0;  //sprite
l[| GLR_LIGHT.subimage] = argument1;  //sprite index 

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);

l[| GLR_LIGHT.bounding_circle] = max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
                     point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle

ds_list_add(global.GLR_LIGHT_LIST_SIMPLE, l);

return l;
