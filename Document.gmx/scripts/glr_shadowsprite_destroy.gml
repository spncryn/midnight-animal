///glr_shadowsprite_destroy(id)

/*
    <=============== DESCRIPTION ===============>
        destroy the shadowsprite with the given id
    
    <===============  ARGUMENTS  ===============>
        id: the shadowsprite id returned by glr_shadowsprite_create
    <===========================================>
*/

ds_list_delete(global.GLR_SPR_DYN_LIST, ds_list_find_index(global.GLR_SPR_DYN_LIST,argument0));
ds_list_destroy(argument0);
