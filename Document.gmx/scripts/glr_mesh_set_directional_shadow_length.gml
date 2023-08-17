///glr_mesh_set_directional_shadow_length(mesh, shadow_length);

/*
    <=============== DESCRIPTION ===============>
        Sets the directional shadow length for
        this mesh
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        shadow_length: the shadow length
    <===========================================>
    You can directly use
    my_mesh[| GLR_MESH.shadow_length_directional] = value;
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
mesh[| GLR_MESH.shadow_length_directional] = argument1;
