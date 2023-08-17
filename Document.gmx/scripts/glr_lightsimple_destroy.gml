///glr_lightsimple_destroy(light)

/*
    <=============== DESCRIPTION ===============>
        Destroy a simple light
        
        HINT:
        If your object has a light and it's
        destroyed remember to call this function
        to delete also the light
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_lightsimple_create()
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_lightsimple(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHTSIMPLE);
}

ds_list_delete(global.GLR_LIGHT_LIST_SIMPLE, ds_list_find_index(global.GLR_LIGHT_LIST_SIMPLE,argument0));
ds_list_destroy(argument0); 
 
