///glr_mesh_set_shadow_strength(mesh id, strength);

/*
    <=============== DESCRIPTION ===============>
        Sets the shadow strength for this mesh.
        Also lights can have shadow strength,
        so the Max shadow-steength value between 
        the light and the mesh will be used.
        
        for example,
        if your light has shadowstrength = 0.5
        and your mesh shadowstrength = 1
        then the shadow will have
        shadow_strength = 1
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        strength: from 0 to 1
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


argument0[| GLR_MESH.shadow_strength] = clamp(argument1,0,1);
