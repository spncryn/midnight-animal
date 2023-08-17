///glr_shadowarea_get_active(id)

/*
    <=============== DESCRIPTION ===============>
        returns true if the shadowarea with
        the given id is active
    
    <===============  ARGUMENTS  ===============>
        id: shadowarea id returned by glr_shadowarea_create
    <===========================================>
*/

var l = argument0;
return l[| GLR_SHADOWAREA.active ];
