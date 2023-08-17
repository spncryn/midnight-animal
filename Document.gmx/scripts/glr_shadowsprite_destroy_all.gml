///glr_shadowsprite_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        destroy all the shadowsprites
    <===========================================>
*/


var size = ds_list_size(global.GLR_SPR_DYN_LIST);
for(i = 0; i < size; i++){
    var s = global.GLR_SPR_DYN_LIST[| i];
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_SPR_DYN_LIST);

var size = ds_list_size(global.GLR_SPR_STC_LIST);
for(i = 0; i < size; i++){
    var s = global.GLR_SPR_STC_LIST[| i];
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_SPR_STC_LIST);
