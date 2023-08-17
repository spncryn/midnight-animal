///glr_mesh_destroy_all()

/*
    <=============== DESCRIPTION ===============>
        Calls glr_mesh_destroy() on ALL meshes
        useful when you change room
    <===========================================>
*/

var i, mesh
var size = ds_list_size(global.GLR_MESH_STC_LIST);
 
repeat(size)
{
    mesh = global.GLR_MESH_STC_LIST[| 0];
    glr_mesh_destroy(mesh);
}
ds_list_clear(global.GLR_MESH_STC_LIST);
 
size = ds_list_size(global.GLR_MESH_DYN_LIST);
repeat(size)
{
    mesh = global.GLR_MESH_DYN_LIST[| 0];
    glr_mesh_destroy(mesh);
}
ds_list_clear(global.GLR_MESH_DYN_LIST);
ds_list_clear(global.GLR_MESH_SORTED_LIST);//depth 


if(surface_exists(global.GLR_DEPTH_SURFACE))
    surface_free(global.GLR_DEPTH_SURFACE);
