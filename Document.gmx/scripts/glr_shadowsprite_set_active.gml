///glr_shadowsprite_set_active(id, active)

/*
    <=============== DESCRIPTION ===============>
        Activate or deactivate the shadowsprite
        with the given id
    
    <===============  ARGUMENTS  ===============>
        id: the shadowsprite id returned by glr_shadowsprite_create
        active: true or false
    <===========================================>
*/

var l = argument0;
l[| GLR_SHADOWSPRITE.active] = argument1;
