///glr_directional_custom_set_transform(id, x, y, xscale, yscale, rotation)
 
/*
    <=============== DESCRIPTION ===============>
        Change the position, rotation, and 
        scaling of the directional custom shadow
        
        You can also use ds accessors to speed
        up your game:
        Look at the code at the end of this file!
        
    <===============  ARGUMENTS  ===============>
        id: the directional custom shadow returned by glr_directional_custom_create
        x: the new x coordinate
        y: the new y coordinate
        xscale: the scaling in x axis
        yscale: the scaling in y axis
        rotation: the new angle
    <===========================================>
*/


var l = argument0; 
l[| GLR_DIRECTIONAL_CUSTOM.px] = argument1;
l[| GLR_DIRECTIONAL_CUSTOM.py] = argument2; 
l[| GLR_DIRECTIONAL_CUSTOM.xscale] = argument3;
l[| GLR_DIRECTIONAL_CUSTOM.yscale] = argument4;
l[| GLR_DIRECTIONAL_CUSTOM.rotation] = argument5;
