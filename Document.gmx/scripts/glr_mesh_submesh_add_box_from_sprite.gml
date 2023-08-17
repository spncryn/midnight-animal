///glr_mesh_submesh_add_box_from_sprite(mesh, sprite, xoffset, yoffset);
 
/*
    <=============== DESCRIPTION ===============>
        Adds a box shaped submesh to a given mesh
        using a sprite to get the width and height
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        sprite: the sprite to use
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

var w = sprite_get_width(argument1);
var h = sprite_get_height(argument1);
var xo = sprite_get_xoffset(argument1);
var yo = sprite_get_yoffset(argument1);
var px = argument2;
var py = argument3;

var l = ds_list_create();
 
//vertices
ds_list_add(l, px-xo, py-yo); 
ds_list_add(l, px+w-xo, py-yo);
ds_list_add(l, px+w-xo, py+h-yo);
ds_list_add(l, px-xo, py+h-yo); 


//add submesh to the mesh
ds_list_add(mesh[| GLR_MESH.meshes], l);
