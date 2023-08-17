///glr_lightsimple_get_active(light);

/*
    <=============== DESCRIPTION ===============>
        Returns true if the light is active
        or false if inactive
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_lightsimple_create()
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_lightsimple(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHTSIMPLE);
}

return argument0[| GLR_LIGHT.active]
