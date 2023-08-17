///glr_mesh_destroy(mesh)

/*
    <=============== DESCRIPTION ===============>
        Destroy the mesh and free the memory
        
        Remember to destroy also the mesh associated
        to an object, when you destroy it
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
    <===========================================>
*/



if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}



var mesh = argument0;

//destroy all submeshes
var submesh_list = mesh[| GLR_MESH.meshes]
var sz = ds_list_size(submesh_list);
for(var i=0; i<sz; i++){
    ds_list_destroy(submesh_list[| i]);
}
ds_list_destroy(submesh_list);
 
//delete vertex buffers
buf = mesh[| GLR_MESH.shadow_vertex_buffer];
if(buf) vertex_delete_buffer(buf); 
//delete vertex buffer
buf = mesh[| GLR_MESH.model_vertex_buffer];
if(buf) vertex_delete_buffer(buf); 

//delete the mesh
if(mesh[| GLR_MESH.static]){
    ds_list_delete(global.GLR_MESH_STC_LIST, ds_list_find_index(global.GLR_MESH_STC_LIST, mesh));
}else{
    ds_list_delete(global.GLR_MESH_DYN_LIST, ds_list_find_index(global.GLR_MESH_DYN_LIST, mesh));
} 

//delete depth
var idx = ds_list_find_index(global.GLR_MESH_SORTED_LIST, mesh);
if(idx >= 0)
    ds_list_delete(global.GLR_MESH_SORTED_LIST, idx);

ds_list_destroy(mesh);
