///glr_set_ambient_color(color)

/*
    <=============== DESCRIPTION ===============>
        Sets the ambient light color
    <===============  ARGUMENTS  ===============>
        color: gamemaker color
        
    <===============  EXAMPLE  ===============>
        glr_set_ambient_color(c_red);
    <===========================================>
*/


global.GLR_AMBIENT_COLOR = argument0;

global.GLR_AMBIENT_R = color_get_red(argument0)/255;
global.GLR_AMBIENT_G = color_get_green(argument0)/255;
global.GLR_AMBIENT_B = color_get_blue(argument0)/255;
