///glr_mesh_set_rotation(mesh id, rotation)

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
mesh[| GLR_MESH.rotation] = argument1;

ds_list_delete(mesh, GLR_MESH.matrix);
ds_list_insert(mesh, GLR_MESH.matrix, matrix_build(
   mesh[| GLR_MESH.px], mesh[| GLR_MESH.py], 0,
   0, 0, argument1,
   mesh[| GLR_MESH.xscale], mesh[| GLR_MESH.yscale], 1
));
