///glr_mesh_submesh_add_list(mesh, vertices_ds_list, xoffset, yoffset);
 

/*
    <=============== DESCRIPTION ===============>
        Adds a submesh from a ds_list of vertices
        for example
        var l = ds_list_create();
        ds_list_add(l, x, y);
        ds_list_add(l, x2, y2);
        ds_list_add(l, x3, y3);
        glr_mesh_submesh_add_list(mesh, l, 0, 0);
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        list: the ds_list with all vertices
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
var vlist = argument1;
var px = argument2;
var py = argument3;

var l = ds_list_create();

var size = ds_list_size(argument1);
for (var n = 0; n < size; n+=2;)
{
    ds_list_add(l, px + vlist[| n]);
    ds_list_add(l, py + vlist[| n+1]);
} 

//add submesh to the mesh
ds_list_add(mesh[| GLR_MESH.meshes], l);
