///glr_light_get_tolerance(light)

/*
    <=============== DESCRIPTION ===============>
        returns the light tolerance

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
            
    <================  EXAMPLE  ================>
        tolerance = glr_light_get_tolerance(light);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

return argument0[| GLR_LIGHT.tolerance];
