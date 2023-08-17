///glr_light_set_scaling(light, xscale, yscale)

/*
    <=============== DESCRIPTION ===============>
        Set the light scaling
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        xscale: the light scale in x axis
        yscale: the light scale in y axis
        
    <===============  EXAMPLE  ===============>
        glr_light_set_scaling(light, image_xscale, image_yscale)
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var l = argument0;
l[| GLR_LIGHT.xscale] = argument1;
l[| GLR_LIGHT.yscale] = argument2;

l[| GLR_LIGHT.bcircle] = l[| GLR_LIGHT.bounding_circle] * max(argument1, argument2);
  
  
ds_list_delete(l, GLR_LIGHT.matrix);
ds_list_insert(l, GLR_LIGHT.matrix, matrix_multiply(
    l[| GLR_LIGHT.matrix_offset],
    matrix_build(
        l[| GLR_LIGHT.px], l[| GLR_LIGHT.py], 0,
        0, 0, l[| GLR_LIGHT.rotation],
        argument1, argument2, 1
    )
));
