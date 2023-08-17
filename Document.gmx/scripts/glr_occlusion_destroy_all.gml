///glr_occlusion_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        Destroy all ambient occlusion sprites
        
    <===========================================>
*/



var size = ds_list_size(global.GLR_OCCLUSION_LIST);
for(i = 0; i < size; i++){
    var s = global.GLR_OCCLUSION_LIST[| i];
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_OCCLUSION_LIST);
ds_list_clear(global.GLR_OCCLUSION_LIST_INST);
