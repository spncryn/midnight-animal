///glr_mesh_get_bcircle(mesh id)

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


return argument0[| GLR_MESH.bounding_circle];
