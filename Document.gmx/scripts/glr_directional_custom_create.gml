///glr_directional_custom_create(sprite, subimage, sprite_shadow, subimage_shadow, x, y, zdepth, xscale, yscale, rotation)

/*
    <=============== DESCRIPTION ===============>
        The fake directional custom shadows are
        useful to simulate the shadows of trees
        or other objects with custom shadows
                 
        the zdepth value is used to cast shadows
        on objects with lower zdepth
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite used as mask
        subimage: the number of the frame
        sprite_shadow: the sprite used as shadow
        subimage_shadow: the number of the frame of the sprite_shadow
        x: coordinate in world space
        y: coordinate in world space
        zdepth: depth from 0 to 16777215 (only integer numbers)
        xscale: scaling in x axis of the sprite
        yscale: scaling in y axis of the sprite
        rotation: angle of the sprite
    <===========================================>
*/

var l = ds_list_create();
l[| GLR_DIRECTIONAL_CUSTOM.active] = true;
l[| GLR_DIRECTIONAL_CUSTOM.type] = GLR_TYPE.directional_custom;
l[| GLR_DIRECTIONAL_CUSTOM.sprite] = argument0;
l[| GLR_DIRECTIONAL_CUSTOM.subimage] = argument1;
l[| GLR_DIRECTIONAL_CUSTOM.sprite_shadow] = argument2;
l[| GLR_DIRECTIONAL_CUSTOM.subimage_shadow] = argument3;
l[| GLR_DIRECTIONAL_CUSTOM.shadow_length] = 1;
l[| GLR_DIRECTIONAL_CUSTOM.px] = argument4;
l[| GLR_DIRECTIONAL_CUSTOM.py] = argument5;
glr_directional_custom_set_depth(l, argument6);
l[| GLR_DIRECTIONAL_CUSTOM.xscale] = argument7;
l[| GLR_DIRECTIONAL_CUSTOM.yscale] = argument8;
l[| GLR_DIRECTIONAL_CUSTOM.rotation] = argument9;

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);

l[| GLR_DIRECTIONAL_CUSTOM.bounding_circle] =  max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
    point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle

ds_list_add(global.GLR_DIR_CUSTOM_LIST, l);
return l;
