///glr_light_set_transform(light, x, y, xscale, yscale, rotation)

/*
    <=============== DESCRIPTION ===============>
        Set the light position, rotation and scaling
        
        HINT:
        to change the transform of a light
        glare, needs to recalculates the light matrix
        so prefer this function if you want to 
        scale and rotate,
        or scale and move,
        or move and rotate, 
        or scale, move and rotate  etc.
        
        in this way the matrix is calculated only once.
        
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        xscale: the light scale in x axis
        yscale: the light scale in y axis
        
    <===============  EXAMPLE  ===============>
        glr_light_set_transform(light, x, y, image_xscale, image_yscale, image_angle);
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
l[| GLR_LIGHT.xscale] = argument3;
l[| GLR_LIGHT.yscale] = argument4; 
l[| GLR_LIGHT.rotation] = argument5; 
 

l[| GLR_LIGHT.bcircle] = l[| GLR_LIGHT.bounding_circle] * max(argument3, argument4); 
      

ds_list_delete(l, GLR_LIGHT.matrix);
ds_list_insert(l, GLR_LIGHT.matrix, matrix_multiply(
    l[| GLR_LIGHT.matrix_offset],
    matrix_build(
        argument1, argument2, 0,
        0, 0, argument5,
        argument3,  argument4, 1
    )
));
 
