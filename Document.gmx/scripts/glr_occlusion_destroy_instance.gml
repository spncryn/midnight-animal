///glr_occlusion_destroy_instance(instance_id);

/*
    <=============== DESCRIPTION ===============>
        Remove ambient occlusion from the given
        instance
        
    <===============  ARGUMENTS  ===============>
        instance_id: the gamemaker instance id
    <===========================================>
*/

ds_list_delete(global.GLR_OCCLUSION_LIST_INST, ds_list_find_index(global.GLR_OCCLUSION_LIST_INST,argument0));
