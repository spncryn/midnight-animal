///glr_mesh_submesh_add_from_tiles(mesh, layer, xoffset, yoffset)

/*
    <=============== DESCRIPTION ===============>
        Adds all vertices of a tile layer to a mesh 
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        layer: the tile layer
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
var tiles = tile_get_ids_at_depth(argument1);
var px = argument2;
var py = argument3;
var len = array_length_1d(tiles);
var t;

for (var i = 0; i < len; i++;)
{
    t = tiles[i];
    glr_mesh_submesh_add_box(mesh,
        tile_get_width(t),
        tile_get_height(t),
        px + tile_get_x(t),
        py + tile_get_y(t)
    );
}
