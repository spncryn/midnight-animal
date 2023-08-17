///glr_light_get_layer(light id)

/*
    <=============== DESCRIPTION ===============>
        returns the light layer

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
            
    <================  EXAMPLE  ================>
        layer = glr_light_get_layer(light);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

return argument0[| GLR_LIGHT.layer];
