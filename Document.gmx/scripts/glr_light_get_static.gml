///glr_light_get_static(light)

/*
    <=============== DESCRIPTION ===============>
        returns true if the light is static

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}


return argument0[| GLR_LIGHT.static];
