///glr_mesh_create(x, y, static)

/*
    <=============== DESCRIPTION ===============>
        Creates an EMPTY mesh
        
        IMPORTANT:
        Use glr_mesh_submesh_* functions to add
        shapes and then finalize the mesh
        with glr_mesh_update() before render it!
    <===============  ARGUMENTS  ===============>
        x: the x coord
        y: the y coord
        static: true if you want this mesh static
    <===========================================>
*/

var l = ds_list_create();
l[| GLR_MESH.type] = GLR_TYPE.mesh;
l[| GLR_MESH.active] = true;
l[| GLR_MESH.static] = argument2;
l[| GLR_MESH.meshes] = ds_list_create();//sub meshes list
l[| GLR_MESH.shadow_vertex_buffer] = -1;
l[| GLR_MESH.model_vertex_buffer] = -1;
l[| GLR_MESH.px] = argument0; //x
l[| GLR_MESH.py] = argument1; //y
l[| GLR_MESH.rotation] = 0; 
l[| GLR_MESH.xscale] = 1; 
l[| GLR_MESH.yscale] = 1; 
l[| GLR_MESH.bounding_circle] = 0; //bounding circle
l[| GLR_MESH.bcircle] = 0; //internal bounding circle
l[| GLR_MESH.layer] = 0; 
l[| GLR_MESH.shadow_strength] = 1; 
l[| GLR_MESH.shadow_length_directional] = 1;
l[| GLR_MESH.height] = 0; 
 
l[| GLR_MESH.matrix] = 0;


l[| GLR_MESH.zdepth] = 0;
l[| GLR_MESH.depth_mask] = -1;
l[| GLR_MESH.depth_mask_index] = -1;

//stats
l[| GLR_MESH.shadow_triangles_count] = 0;
l[| GLR_MESH.model_triangles_count] = 0;
l[| GLR_MESH.shadow_vertex_count] = 0;
 
ds_list_insert(l, GLR_MESH.matrix, matrix_build(argument0, argument1, 0, 0, 0, 0, 1, 1, 1));


if(argument[2] == true){
    ds_list_add(global.GLR_MESH_STC_LIST, l);
}
else{
    ds_list_add(global.GLR_MESH_DYN_LIST, l);
}


return l;
