///glr_directional_custom_set_shadow_length(id, length)
 
/*
    <=============== DESCRIPTION ===============>
        Change the length of the
        directional custom shadow
        
        HINT:
        you can use GM:Studio ds accessors!
        
    <===============  ARGUMENTS  ===============>
        id: the directional custom shadow returned by glr_directional_custom_create
        length: the new directional shadow length 
    <===========================================>
*/


var l = argument0;   
l[| GLR_DIRECTIONAL_CUSTOM.shadow_length] = argument1;
 
