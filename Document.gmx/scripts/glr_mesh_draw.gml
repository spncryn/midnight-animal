///glr_mesh_draw(mesh id, color, alpha)

/*
    <=============== DESCRIPTION ===============>
        Draw the shape of the mesh
        Useful to debug
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        color: gamemaker color
        alpha: transparency from 0 to 1
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
var color = argument1;
var alpha = argument2;

matrix_set(matrix_world, mesh[| GLR_MESH.matrix]);
shader_set(glr_shader_mesh_color);
shader_set_uniform_f(global.GLR_UNIF_MESH_COLOR, color_get_red(color), color_get_green(color), color_get_blue(color), alpha);
vertex_submit(mesh[| GLR_MESH.model_vertex_buffer], pr_trianglelist, -1);
shader_reset();
d3d_transform_set_identity(); 
