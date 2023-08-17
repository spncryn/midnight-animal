///glr_mesh_get_transform(mesh id)


if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}



var array;
array[0]=argument0[| GLR_MESH.px];
array[1]=argument0[| GLR_MESH.py];
array[2]=argument0[| GLR_MESH.xscale];
array[3]=argument0[| GLR_MESH.yscale];
array[4]=argument0[| GLR_MESH.rotation];
return array;
