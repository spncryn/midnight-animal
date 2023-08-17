///glr_light_get_depth(light)

/*
    <=============== DESCRIPTION ===============>
        returns the light depth

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
            
    <================  EXAMPLE  ================>
        depth = glr_light_get_depth(light);
    <===========================================>
*/
if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

return argument0[| GLR_LIGHT.zdepth];
