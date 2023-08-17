///glr_lightsimple_set_alpha(light, alpha);

/*
    <=============== DESCRIPTION ===============>
        Sets the simple light alpha
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_lightsimple_create()
        color: the light transparency
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_lightsimple(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHTSIMPLE);
}

argument0[| GLR_LIGHT.alpha] = argument1;
