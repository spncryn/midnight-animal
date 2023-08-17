///glr_light_set_intensity(light, intensity)

/*
    <=============== DESCRIPTION ===============>
        sets the intensity/brightness value for
        the light.
        
        ONLY AVAILABLE if you use glr_draw_gamma

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        intensity: brightness value from 0 to 1
    
    <===============  EXAMPLE  ===============>
        glr_light_set_intensity(light, 0.5);
    <===========================================>
*/
if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}
argument0[| GLR_LIGHT.intensity] = argument1;
