///glr_shadowsprite_create_from_instance(static)

/*
    <=============== DESCRIPTION ===============>
        Creates a new shadowsprite using
        the current instance's parameters
        
        HINT: static shadowsprites cannot be moved
        but are much faster
        
        
        Prefer to use mesh shadows instead of sprite shadows
        they are faster and you can use more features
    
    <===============  ARGUMENTS  ===============>
        static: true if static
    <===========================================>
*/


var l = ds_list_create();
l[| GLR_SHADOWSPRITE.active] = true;
l[| GLR_SHADOWSPRITE.layer] = 0;
l[| GLR_SHADOWSPRITE.static] = argument0;
l[| GLR_SHADOWSPRITE.sprite] = sprite_index;
l[| GLR_SHADOWSPRITE.subimage] = image_index;
l[| GLR_SHADOWSPRITE.px] = x;
l[| GLR_SHADOWSPRITE.py] = y;
l[| GLR_SHADOWSPRITE.xscale] = image_xscale;
l[| GLR_SHADOWSPRITE.yscale] = image_yscale;
l[| GLR_SHADOWSPRITE.rotation] = image_angle;

var width = sprite_get_width(sprite_index);
var height = sprite_get_height(sprite_index);
var xo =  sprite_get_xoffset(sprite_index);
var yo =  sprite_get_yoffset(sprite_index);
l[| GLR_SHADOWSPRITE.bcircle] = max(
        point_distance(0, 0, xo, yo),
        point_distance(width, 0, xo, yo), 
        point_distance(width, height, xo, yo),
        point_distance(0, height, xo, yo));
 
if(argument0)
    ds_list_add(global.GLR_SPR_STC_LIST, l);
else
    ds_list_add(global.GLR_SPR_DYN_LIST, l);
    
return l;
