///glr_directional_custom_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        Destroy all existing directional custom shadows.
    <===========================================>
*/


var size = ds_list_size(global.GLR_DIR_CUSTOM_LIST);
for(i = 0; i < size; i++)
{
    var s = global.GLR_DIR_CUSTOM_LIST[| i];
    //delete depth
    var idx = ds_list_find_index(global.GLR_MESH_SORTED_LIST, s);
    if(idx >= 0)
        ds_list_delete(global.GLR_MESH_SORTED_LIST, idx);
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_DIR_CUSTOM_LIST);
