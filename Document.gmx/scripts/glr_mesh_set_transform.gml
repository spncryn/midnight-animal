///glr_mesh_set_transform(meshid, x, y, xscale, yscale, rotation)

/*
    <=============== DESCRIPTION ===============>
        Sets the position, rotation and scaling
        
        Prefer this function if you change 2
        or more of this values
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
mesh[| GLR_MESH.px] = argument1;
mesh[| GLR_MESH.py] = argument2; 
mesh[| GLR_MESH.xscale] = argument3;
mesh[| GLR_MESH.yscale] = argument4; 
mesh[| GLR_MESH.rotation] = argument5;
ds_list_delete(mesh, GLR_MESH.matrix);
ds_list_insert(mesh, GLR_MESH.matrix,  matrix_build(
   argument1, argument2, 0,
   0, 0, argument5,
   argument3, argument4, 1
));
