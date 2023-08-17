///glr_occlusion_set_active(id, active);

/*
    <=============== DESCRIPTION ===============>
        Activate or Deactivate the sprite occlusion
        
    <===============  ARGUMENTS  ===============>
        id: the occlusion id returned by glr_occlusion_create
        active: true or false
    <===========================================>
*/

var l = argument0;
l[| GLR_OCCLUSION.active] = argument1;
