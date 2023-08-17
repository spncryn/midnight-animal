///glr_lightsimple_set_color(light, color);

/*
    <=============== DESCRIPTION ===============>
        Sets the light color
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_lightsimple_create()
        color: the light color
    <===========================================>
*/


if(debug_mode)
{
    if(!glr_debug_is_lightsimple(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHTSIMPLE);
}

argument0[| GLR_LIGHT.color] = argument1;
