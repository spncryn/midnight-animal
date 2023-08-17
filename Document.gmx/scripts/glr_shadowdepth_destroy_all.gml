///glr_shadowdepth_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        Destroy all existing shadowdepths.
    <===========================================>
*/


var size = ds_list_size(global.GLR_DEP_DYN_LIST);
for(i = 0; i < size; i++){
    var s = global.GLR_DEP_DYN_LIST[| i];
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_DEP_DYN_LIST);
