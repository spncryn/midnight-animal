///glr_occlusion_destroy(id);

/*
    <=============== DESCRIPTION ===============>
        Destroy the given ambient occlusion
        to free memory
        
    <===============  ARGUMENTS  ===============>
        id: occlusion id returned by glr_occlusion_create
        
    <===========================================>
*/


var l_id = argument0;
ds_list_delete(global.GLR_OCCLUSION_LIST, ds_list_find_index(global.GLR_OCCLUSION_LIST,argument0));
ds_list_destroy(argument0); 
 
