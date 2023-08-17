///glr_light_set_static(light, static)

/*
    <=============== DESCRIPTION ===============>
        Set the light as static
        If your light is static, you can't move
        it, but you gain lot of performance
        
        if you want to move a static light
        use glr_light_refresh after the movement
        

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        static: true if static 
        
    <===============  EXAMPLE  ===============>
        glr_light_set_static(light, true);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var l = argument0;
var t_sur = l[| GLR_LIGHT.surf_shadowmap];
if(t_sur != -1)
{
    surface_free(t_sur);
    l[| GLR_LIGHT.surf_shadowmap] = -1;
}
l[| GLR_LIGHT.static] = argument1; 
