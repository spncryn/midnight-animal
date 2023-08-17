///glr_shadowdepth_get_depth(id)
 
/*
    <=============== DESCRIPTION ===============>
        Get the depth of the shadowdepth
        
        HINT:
        you can use GM:Studio ds accessors!
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
    <===========================================>
*/


var l = argument0;   
return l[| GLR_SHADOWDEPTH.zdepth];
