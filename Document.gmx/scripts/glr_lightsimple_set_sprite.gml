///glr_lightsimple_set_sprite(light, sprite, subimage)

/*
    <=============== DESCRIPTION ===============>
        Set the sprite and/or  the subimage
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_lightsimple_create()
        sprite: sprite mask
        subimage: the frame of the sprite
    <===========================================>
*/


if(debug_mode)
{
    if(!glr_debug_is_lightsimple(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHTSIMPLE);
}


argument0[| GLR_LIGHT.sprite] = argument1;
argument0[| GLR_LIGHT.subimage] = argument1;
