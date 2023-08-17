///glr_lightsimple_destroy_all()

/*
    <=============== DESCRIPTION ===============>
        Destroy a all simple lights
    <===========================================>
*/
var light_list_size = ds_list_size(global.GLR_LIGHT_LIST_SIMPLE);
for(i = 0; i < light_list_size; i++)
{   
    var l_id = global.GLR_LIGHT_LIST_SIMPLE[| i]; 
    ds_list_destroy(l_id); 
}
ds_list_clear(global.GLR_LIGHT_LIST_SIMPLE);
 
