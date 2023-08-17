///glr_mesh_submesh_add_json(mesh, json_string, xoffset, yoffset);
  
/*
    ================================================
        EDITOR LINK : https://tizzio.github.io/meshgen
    ================================================

    <=============== DESCRIPTION ===============>
        Adds a submesh to a mesh from a json string
        
        example:
        glr_mesh_submesh_add_json(mesh, "[[1,2],[3,4],[5,6]]", 0, 0);
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        json: the json string created with the Online Mesh Editor
        xoffset: the x offset
        yoffset: the y offset
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
 
var px = argument2;
var py = argument3;

var l = ds_list_create();
 
 
var resultMap = json_decode(argument1);
var list = ds_map_find_value(resultMap, "default");
var size = ds_list_size(list);
for (var n = 0; n < size; n++;)
{
    var vtx = list[| n];
    ds_list_add(l, px + vtx[| 0], py + vtx[| 1]);
}
ds_list_destroy(list);
ds_map_destroy(resultMap);

ds_list_add(mesh[| GLR_MESH.meshes], l);
