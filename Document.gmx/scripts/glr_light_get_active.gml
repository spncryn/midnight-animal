///glr_light_get_active(light)

/*
    <=============== DESCRIPTION ===============>
        returns true if the light is active

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        
    <================  EXAMPLE  ================>
        active = glr_light_get_active(light);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

return argument0[| GLR_LIGHT.active];
