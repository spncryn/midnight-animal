///glr_light_destroy_all();

/*
    <=============== DESCRIPTION ===============>
        Destroy all lights.
        Calls glr_light_destroy() on all lights        
    <===========================================>
*/

var light_list_size, i, l_id, light_list_size;

light_list_size  = ds_list_size(global.GLR_LIGHT_LIST);

for(i = 0; i < light_list_size ; i++)
{   
    l_id = global.GLR_LIGHT_LIST[| i];
    var s1 = l_id[| GLR_LIGHT.surf_light];
    if(surface_exists(s1)) surface_free(s1);
    var s2 = l_id[| GLR_LIGHT.surf_shadowmap];
    if(surface_exists(s2)) surface_free(s2);
    var s3 = l_id[| GLR_LIGHT.surf_shadowsprite1];
    if(surface_exists(s3)) surface_free(s3);
    var s4 = l_id[| GLR_LIGHT.surf_shadowsprite2];
    if(surface_exists(s4)) surface_free(s4); 
    
    ds_list_destroy(l_id); 
}
ds_list_clear(global.GLR_LIGHT_LIST);
