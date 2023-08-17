///glr_shadowsprite_create(sprite, subimage, x, y, xscale, yscale, rotation, static)

/*
    <=============== DESCRIPTION ===============>
        Creates a new shadowsprite
        
        HINT: static shadowsprites cannot be moved
        but they are much faster
        
        Prefer to use mesh shadows instead of sprite shadows
        they are faster and you can use more features
    
    <===============  ARGUMENTS  ===============>
        sprite: the sprite used as mask
        subimage: the number of the frame
        x: coordinate in world space
        y: coordinate in world space
        xscale: scaling in x axis of the sprite
        yscale: scaling in y axis of the sprite
        rotation: angle of the sprite
        static: true if static
    <===========================================>
*/

var l = ds_list_create();
l[| GLR_SHADOWSPRITE.active] = true;
l[| GLR_SHADOWSPRITE.layer] = 0;
l[| GLR_SHADOWSPRITE.static] = argument7;
l[| GLR_SHADOWSPRITE.sprite] = argument0;
l[| GLR_SHADOWSPRITE.subimage] = argument1;
l[| GLR_SHADOWSPRITE.px] = argument2;
l[| GLR_SHADOWSPRITE.py] = argument3;
l[| GLR_SHADOWSPRITE.xscale] = argument4;
l[| GLR_SHADOWSPRITE.yscale] = argument5;
l[| GLR_SHADOWSPRITE.rotation] = argument6;

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);
l[| GLR_SHADOWSPRITE.bcircle] = max(
        point_distance(0, 0, xo, yo),
        point_distance(width, 0, xo, yo), 
        point_distance(width, height, xo, yo),
        point_distance(0, height, xo, yo));
 
if(argument7)
    ds_list_add(global.GLR_SPR_STC_LIST, l);
else
    ds_list_add(global.GLR_SPR_DYN_LIST, l);
    
return l;
