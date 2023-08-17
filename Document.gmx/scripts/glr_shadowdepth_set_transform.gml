///glr_shadowdepth_set_transform(id, x, y, xscale, yscale, rotation)
 
/*
    <=============== DESCRIPTION ===============>
        Change the position, rotation, and 
        scaling of the shadowdepth
        
        You can also use ds accessors to speed
        up your game:
        Look at the code at the end of this file!
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
        x: the new x coordinate
        y: the new y coordinate
        xscale: the scaling in x axis
        yscale: the scaling in y axis
        rotation: the new angle
    <===========================================>
*/


var l = argument0; 
l[| GLR_SHADOWDEPTH.px] = argument1;
l[| GLR_SHADOWDEPTH.py] = argument2; 
l[| GLR_SHADOWDEPTH.xscale] = argument3;
l[| GLR_SHADOWDEPTH.yscale] = argument4;
l[| GLR_SHADOWDEPTH.rotation] = argument5;
