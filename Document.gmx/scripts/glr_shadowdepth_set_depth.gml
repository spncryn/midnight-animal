///glr_shadowdepth_set_depth(id, depth)
 
/*
    <=============== DESCRIPTION ===============>
        Change the depth of the shadowdepth
        
        HINT:
        you can use GM:Studio ds accessors!
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
        zdepth: depth value from 0 to 16777215 (only integer numbers)
    <===========================================>
*/


var l = argument0;   
l[| GLR_SHADOWDEPTH.zdepth] = argument1;
