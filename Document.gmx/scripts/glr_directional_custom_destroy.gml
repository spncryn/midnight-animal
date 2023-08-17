///glr_directional_custom_destroy(id)

/*
    <=============== DESCRIPTION ===============>
        Destroy the custom directional shadow
        with the given id.
        
    <===============  ARGUMENTS  ===============>
        id: the shadow returned by glr_directional_custom_create
    <===========================================>
*/

ds_list_delete(global.GLR_DIR_CUSTOM_LIST, ds_list_find_index(global.GLR_DIR_CUSTOM_LIST,argument0));
//delete depth
var idx = ds_list_find_index(global.GLR_MESH_SORTED_LIST, argument0);
if(idx >= 0)
    ds_list_delete(global.GLR_MESH_SORTED_LIST, idx);
ds_list_destroy(argument0);
