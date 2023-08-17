///glr_receiver_create(sprite, subimage, x, y, xscale, yscale, rotation)

/*
    <=============== DESCRIPTION ===============>
        Create a shadow receiver using the given
        sprite
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite that receives shadows
        subimage: the number of the frame
        x: coordinate in world space
        y: coordinate in world space
        xscale: scaling in x axis of the sprite
        yscale: scaling in y axis of the sprite
        rotation: angle of the sprite
        
    <===========================================>
*/

var l = ds_list_create();
l[| GLR_RECEIVER.type] = GLR_TYPE.receiver;
l[| GLR_RECEIVER.active] = true;
l[| GLR_RECEIVER.sprite] = argument0;
l[| GLR_RECEIVER.subimage] = argument1;
l[| GLR_RECEIVER.px] = argument2; 
l[| GLR_RECEIVER.py] = argument3; 
l[| GLR_RECEIVER.xscale] = argument4; 
l[| GLR_RECEIVER.yscale] = argument5; 
l[| GLR_RECEIVER.rotation] = argument6; 

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);
l[| GLR_RECEIVER.bcircle] =  max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
                     point_distance(width, height, xo, yo), point_distance(0, height, xo, yo));

ds_list_add(global.GLR_RECEIVER_LIST, l);
return l;
