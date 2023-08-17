///glr_directional_custom_set_active(id, active)

/*
    <=============== DESCRIPTION ===============>
        Activate and Deactivate the directional
        custom shadow
        
    <===============  ARGUMENTS  ===============>
        id: the directional custom shadow returned
        by glr_directional_custom_create
        active: true or false
    <===========================================>
*/

var l = argument0;
l[| GLR_DIRECTIONAL_CUSTOM.active] = argument1;
