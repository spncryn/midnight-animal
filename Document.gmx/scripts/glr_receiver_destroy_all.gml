///glr_receiver_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        Destroy all the shadow receivers  
    <===========================================>
*/

var size = ds_list_size(global.GLR_RECEIVER_LIST);
for(i = 0; i < size; i++){
    var s = global.GLR_RECEIVER_LIST[| i];
    ds_list_destroy(s);
}
ds_list_clear(global.GLR_RECEIVER_LIST);
