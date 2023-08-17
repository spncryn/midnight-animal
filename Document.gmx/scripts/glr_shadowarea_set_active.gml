///glr_shadowarea_set_active(id, active)

/*
    <=============== DESCRIPTION ===============>
        Activate or deactivate the shadowarea
        with the given id
    
    <===============  ARGUMENTS  ===============>
        id: shadowarea id returned by glr_shadowarea_create
        active: true or false
    <===========================================>
*/

var l = argument0;
l[| GLR_SHADOWAREA.active ] = argument1;
