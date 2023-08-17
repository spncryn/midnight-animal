///glr_occlusion_create(sprite, subimage, x, y, xscale, yscale, rotation);

/*
    <=============== DESCRIPTION ===============>
        Create ambient occlusion around the
        given sprite at the given position
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite used as mask
        subimage: the number of the frame
        x: coordinate in world space
        y: coordinate in world space
        xscale: scaling in x axis of the sprite
        yscale: scaling in y axis of the sprite
        rotation: angle of the sprite
        
    <===============  RETURN  ===============>
        id of the occlusion (integer number)
    <===========================================>
*/


var l = ds_list_create();
l[| GLR_OCCLUSION.sprite] = argument0;
l[| GLR_OCCLUSION.subimage] = argument1;
l[| GLR_OCCLUSION.px] = argument2;
l[| GLR_OCCLUSION.py] = argument3;
l[| GLR_OCCLUSION.xscale] = argument4;
l[| GLR_OCCLUSION.yscale] = argument5;
l[| GLR_OCCLUSION.rotation] = argument6;

//bounding circle
var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);
var bcircle = max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle
l[| GLR_OCCLUSION.bcircle] = bcircle;
l[| GLR_OCCLUSION.bounding_circle] = bcircle*max(argument4, argument5);

ds_list_add(global.GLR_OCCLUSION_LIST, l);

return l;
