///glr_shadowsprite_update_instance(id)

/*
    <=============== DESCRIPTION ===============>
        Update the shadowsprite parameters using
        the current instance's transform

    <===============  ARGUMENTS  ===============>
        id: the shadowsprite id returned by glr_shadowsprite_create
    <===========================================>
*/

var l = argument0;
l[| GLR_SHADOWSPRITE.sprite] = sprite_index;
l[| GLR_SHADOWSPRITE.subimage] = image_index;
l[| GLR_SHADOWSPRITE.px] = x;
l[| GLR_SHADOWSPRITE.py] = y;
l[| GLR_SHADOWSPRITE.xscale] = image_xscale;
l[| GLR_SHADOWSPRITE.yscale] = image_yscale;
l[| GLR_SHADOWSPRITE.rotation] = image_angle; 
