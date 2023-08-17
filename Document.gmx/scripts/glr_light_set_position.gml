///glr_light_set_position(light, x, y)

/*
    <=============== DESCRIPTION ===============>
        Set the light position
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        x: the x coordinate in world space
        y: the y coordinate in world space
        
    <===============  EXAMPLE  ===============>
        glr_light_set_position(light, x, y);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var l = argument0;
l[| GLR_LIGHT.px] = argument1;
l[| GLR_LIGHT.py] = argument2; 


ds_list_delete(l, GLR_LIGHT.matrix);
ds_list_insert(l, GLR_LIGHT.matrix, matrix_multiply(
    l[| GLR_LIGHT.matrix_offset],
    matrix_build(
        argument1, argument2, 0,
        0, 0, l[| GLR_LIGHT.rotation],
        l[| GLR_LIGHT.xscale], l[| GLR_LIGHT.yscale], 1
    )
));
 
 
