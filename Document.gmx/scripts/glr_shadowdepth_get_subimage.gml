///glr_shadowdepth_get_subimage(id)

/*
    <=============== DESCRIPTION ===============>
        Get the subimage of the shadowdepth
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
    <===========================================>
*/


var l = argument0;   
return l[| GLR_SHADOWDEPTH.subimage];
