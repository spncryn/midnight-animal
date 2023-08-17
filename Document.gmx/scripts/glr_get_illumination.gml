///glr_get_illumination(x, y)

/*
    <=============== DESCRIPTION ===============>
        Gets the illumination value of a pixel 
        in the surface at x,y coordinate
        
    <===============  ARGUMENTS  ===============>
        x: screen space x coordinate
        y: screen space y coordinate
        
    <===============  EXAMPLE  ===============>
        glr_get_illumination(obj_glr_player.x - view_xview, obj_glr_player.y - view_yview);
    <===========================================>
*/


var px = floor(argument0 * global.GLR_MAIN_QUALITY);
var py = floor(argument1 * global.GLR_MAIN_QUALITY);

var val = buffer_peek(global.GLR_ILLUM_BUFFER, (px + py * global.GLR_MAIN_SURFACE_WIDTH )* 4, buffer_u32);
 
return colour_get_value(val & 16777215) / 255; 
