///glr_light_set_shadow_strength(light id, strength)

/*
    <=============== DESCRIPTION ===============>
        Set the light minimum shadow stregth
        
        if you have a mesh with "strength = 0.7"
        and a light with "strength = 0.5"
        
        the max value will be used (0.7)

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        strength: the minimum shadow strength (from 0 to 1)
        
    <===============  EXAMPLE  ===============>
        glr_light_set_shadow_strength(light id, 0.5)
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var light = argument0;
light[| GLR_LIGHT.shadow_strength] = clamp(argument1,0, 1);
 
