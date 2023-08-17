///glr_get_vertex_count()

/*
    <=============== DESCRIPTION ===============>
        Get the total number of vertices
        
    <===============  EXAMPLE  ===============>
        num_vertices = glr_get_vertex_count();
    <===========================================>
*/

var i, mesh;

var vertices = 0;

var size = ds_list_size(global.GLR_MESH_STC_LIST);
for(i=0; i<size; i++){
    mesh = global.GLR_MESH_STC_LIST[| i];
    vertices += glr_mesh_get_vertex_count(mesh);
} 

size = ds_list_size(global.GLR_MESH_DYN_LIST);
for(i=0; i<size; i++){
    mesh = global.GLR_MESH_DYN_LIST[| i];
    vertices += glr_mesh_get_vertex_count(mesh);
}

return vertices;
