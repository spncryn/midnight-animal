///glr_mesh_set_height(mesh id, height)

/*
    <=============== DESCRIPTION ===============>
        Sets the depth for directional lights
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        height: the directional height of this mesh
    <===========================================>
*/


if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


argument0[| GLR_MESH.height] = argument1;
