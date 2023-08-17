///glr_occlusion_set_sprite(id, sprite, subimage);

/*
    <=============== DESCRIPTION ===============>
        Change the sprite occlusion
        
    <===============  ARGUMENTS  ===============>
        id: the occlusion id returned by glr_occlusion_create
        sprite: the new sprite
        sprite: the new subimage
    <===========================================>
*/

var l = argument0;
l[| GLR_OCCLUSION.sprite] = argument1;
l[| GLR_OCCLUSION.subimage] = argument2;
