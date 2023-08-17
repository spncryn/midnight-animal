///glr_shadowdepth_get_active(id)

/*
    <=============== DESCRIPTION ===============>
        Returns true if the shadowdepth is active
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
    <===========================================>
*/


var l = argument0;
return l[| GLR_SHADOWDEPTH.active];
