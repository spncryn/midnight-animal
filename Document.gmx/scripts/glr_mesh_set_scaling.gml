///glr_mesh_set_scaling(mesh id, xscale, yscale)

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
mesh[| GLR_MESH.xscale] = argument1;
mesh[| GLR_MESH.yscale] = argument2;

ds_list_delete(mesh, GLR_MESH.matrix);
ds_list_insert(mesh, GLR_MESH.matrix, matrix_build(
   mesh[| GLR_MESH.px], mesh[| GLR_MESH.py], 0,
   0, 0, mesh[| GLR_MESH.rotation],
   argument1, argument2, 1
));
 
mesh[| GLR_MESH.bcircle] = mesh[| GLR_MESH.bounding_circle] * max(argument1, argument2);
