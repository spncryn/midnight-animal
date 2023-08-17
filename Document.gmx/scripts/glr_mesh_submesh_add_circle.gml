///glr_mesh_submesh_add_circle(mesh, radius, num_vertices, xoffset, yoffset);

/*
    <=============== DESCRIPTION ===============>
        Adds a circle shape to a mesh
        
        example:
        glr_mesh_submesh_add_circle(mesh, 10, 10, 0, 0);
    
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        radius: the radius of the circle
        num_vertices: the number of vertices to use
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
var r = argument1;
var delta_angle = 360/argument2;
var px = argument3;
var py = argument4;

var l = ds_list_create();
 
for(var i = 360; i > 0; i -= delta_angle){
    ds_list_add(l, px + lengthdir_x(r, i), py + lengthdir_y(r, i));
}

//add vertex count
ds_list_add(mesh[| GLR_MESH.meshes], l );
