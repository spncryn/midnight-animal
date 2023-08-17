///glr_light_set_depth(light, depth)

/*
    <=============== DESCRIPTION ===============>
        Set the light z depth.
        
        If the light depth is smaller than
        the mesh's depth, the mesh is shadowed
        
        the same for shadowdepth        

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        depth: from 0 to 16777215 (only integer numbers)
        
    <===============  EXAMPLE  ===============>
        //global.GLR_MAX_DEPTH is 16777215;
        glr_light_set_depth(light, global.GLR_MAX_DEPTH);
    <===========================================>
*/
if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}
argument0[| GLR_LIGHT.zdepth] = argument1;
