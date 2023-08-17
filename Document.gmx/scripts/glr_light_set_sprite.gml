///glr_light_set_sprite(light, sprite, subimage)

/*
    <=============== DESCRIPTION ===============>
        Set the sprite and/or  the subimage
        
        if you want to set only the subimage
        you can pass the same sprite
        or use the accessors:
        my_light[| GLR_LIGHT.subimage] = my_subimage;
        
        NB. don't use the accessor to change
        the Sprite! or you need to recalculate 
        the offset matrix
        

    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        sprite: sprite mask
        subimage: the frame of the sprite
        
    <===============  EXAMPLE  ===============>
        glr_light_set_sprite(light, spr_light_mask_point, 0);
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var l = argument0;

if(argument1 != l[| GLR_LIGHT.sprite]){

    var xscale = l[| GLR_LIGHT.xscale];
    var yscale = l[| GLR_LIGHT.yscale];
    var width = sprite_get_width(argument1);
    var height = sprite_get_height(argument1);
    var xo =  sprite_get_xoffset(argument1);
    var yo =  sprite_get_yoffset(argument1);
    
    l[| GLR_LIGHT.xoffset] = xo;  //xoffset
    l[| GLR_LIGHT.yoffset] = yo;  //yoffset
    
    var bcircle = max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle
    l[| GLR_LIGHT.bounding_circle] = bcircle;
    l[| GLR_LIGHT.bcircle]  = bcircle * max(xscale, yscale) ; //pre computed bounding circle
    
    var mtx_offset = matrix_build(-xo, -yo, 0, 0, 0, 0, width, height, 1);
    
    ds_list_delete(l, GLR_LIGHT.matrix_offset);
    ds_list_insert(l, GLR_LIGHT.matrix_offset, mtx_offset);
 
    ds_list_delete(l, GLR_LIGHT.matrix);
    ds_list_insert(l, GLR_LIGHT.matrix, matrix_multiply(mtx_offset,  
        matrix_build(
            l[| GLR_LIGHT.px], l[| GLR_LIGHT.py], 0,
            0, 0, l[| GLR_LIGHT.rotation],
            l[| GLR_LIGHT.xscale], l[| GLR_LIGHT.yscale], 1
        ))) ;
    
    l[| GLR_LIGHT.sprite] = argument1;
}

//change subimage
l[| GLR_LIGHT.subimage] = argument2;
 
 
