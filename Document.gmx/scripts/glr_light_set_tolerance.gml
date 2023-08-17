///glr_light_set_tolerance(light, tolerance)

/*
    <=============== DESCRIPTION ===============>
        Set the mesh deactivation distance from
        the light (also negative)

        Example:
        if your light is 80 pixel, and your mesh
        is 32 pixel, the default deactivation will
        be calculated in this way:
        if( Distance_from_light  >  80/2 + 32/2 - tolerance )
        {
            render mesh
        }

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        tolerance: tolerance distance in pixel
    
    <===============  EXAMPLE  ===============>
        glr_light_set_tolerance(light, 128);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var l = argument0;
l[| GLR_LIGHT.tolerance] = argument1;
