///glr_mesh_set_position(mesh id, x, y)

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
mesh[| GLR_MESH.px] = argument1;
mesh[| GLR_MESH.py] = argument2; 

ds_list_delete(mesh, GLR_MESH.matrix);
ds_list_insert(mesh, GLR_MESH.matrix, matrix_build(
   argument1, argument2, 0,
   0, 0, mesh[| GLR_MESH.rotation],
   mesh[| GLR_MESH.xscale], mesh[| GLR_MESH.yscale], 1
));
