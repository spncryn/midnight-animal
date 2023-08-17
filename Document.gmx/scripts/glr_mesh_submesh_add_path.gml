///glr_mesh_submesh_add_path(mesh, path, xoffset, yoffset);


 
/*
    <=============== DESCRIPTION ===============>
        Adds a submesh to a mesh from a gamemaker path
        
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        path: the gamemaker path
        x: the x offset
        y: the y offset
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

var l = ds_list_create()
 
var num = path_get_number(argument1); 

for(var i = 0; i < num; i++)
{
    ds_list_add(l, px + path_get_point_x(argument1,i), py +path_get_point_y(argument1,i));
}

ds_list_add(mesh[| GLR_MESH.meshes], l);
