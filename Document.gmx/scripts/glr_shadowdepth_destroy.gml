///glr_shadowdepth_destroy(id)

/*
    <=============== DESCRIPTION ===============>
        Destroy the shadowdepth with the given id.
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
    <===========================================>
*/

ds_list_delete(global.GLR_DEP_DYN_LIST, ds_list_find_index(global.GLR_DEP_DYN_LIST,argument0));
ds_list_destroy(argument0);
