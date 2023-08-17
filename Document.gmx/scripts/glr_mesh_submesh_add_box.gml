///glr_mesh_submesh_add_box(mesh, width, height, xoffset, yoffset);

/*
    <=============== DESCRIPTION ===============>
        Adds a box shaped submesh to a given mesh
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        width: the box width 
        height: the box height
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

var w = argument1;
var h = argument2;
var px = argument3;
var py = argument4;

var l = ds_list_create();
 
//vertices
ds_list_add(l, px, py);
ds_list_add(l, px+w, py);
ds_list_add(l, px+w, py+h);
ds_list_add(l, px, py+h);

//add submesh to the mesh
ds_list_add(mesh[| GLR_MESH.meshes], l);
