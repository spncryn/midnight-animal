///glr_receiver_destroy(id);

/*
    <=============== DESCRIPTION ===============>
        Destroy the receiver with the given id       
        
    <===============  ARGUMENTS  ===============>
        id: receiver id returned by glr_receiver_create     
    <===========================================>
*/


ds_list_delete(global.GLR_RECEIVER_LIST, ds_list_find_index(global.GLR_RECEIVER_LIST, argument0));
ds_list_destroy(argument0);
