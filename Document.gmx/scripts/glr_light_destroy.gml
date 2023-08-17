///glr_light_destroy(light);

/*
    <=============== DESCRIPTION ===============>
        Destroy the light and free all surfaces
        
        
        HINT:
        If your object has a light and it's
        destroyed remember to call this function
        to delete also the light
        
    <===============  ARGUMENTS  ===============>
        light: the light id returned by glr_light_create()
        
    
    <===============  EXAMPLE  ===============>
        glr_light_destroy(light);
    <===========================================>
*/



var l_id = argument0;


if(debug_mode)
{
    if(!glr_debug_is_light(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_LIGHT);
}

var s1 = l_id[| GLR_LIGHT.surf_light];
if(surface_exists(s1)) surface_free(s1);
var s2 = l_id[| GLR_LIGHT.surf_shadowmap];
if(surface_exists(s2)) surface_free(s2);

var s3 = l_id[| GLR_LIGHT.surf_shadowsprite1];
if(surface_exists(s3)) surface_free(s3);
var s4 = l_id[| GLR_LIGHT.surf_shadowsprite2];
if(surface_exists(s4)) surface_free(s4); 

ds_list_delete(global.GLR_LIGHT_LIST, ds_list_find_index(global.GLR_LIGHT_LIST,argument0));
ds_list_delete(l_id, GLR_LIGHT.matrix); 
ds_list_delete(l_id, GLR_LIGHT.matrix_offset); 
ds_list_destroy(l_id);
 
