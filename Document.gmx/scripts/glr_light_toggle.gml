///glr_light_toggle(light)

/*
    <=============== DESCRIPTION ===============>
        Switch on/off the light
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        
    <===============  EXAMPLE  ===============>
        glr_light_toggle(light);
    <===========================================>
*/

var light = argument0;
if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}
light[| GLR_LIGHT.active] = !light[| GLR_LIGHT.active];
