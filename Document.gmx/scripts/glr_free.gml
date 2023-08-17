///glr_free()


/*
    <=============== DESCRIPTION ===============>
        Destroy all the engine's data structures
        you have to re-call glr_init
        
        Useful if you want to totally disable
        glare engine
    <===========================================>
*/


glr_clear_all();

//free all surfaces
if(surface_exists(global.GLR_MAIN_SURFACE))
    surface_free(global.GLR_MAIN_SURFACE);
    
if(surface_exists(global.GLR_DIRECTIONAL_SURFACE))
    surface_free(global.GLR_DIRECTIONAL_SURFACE);
    
if(surface_exists(global.GLR_DEPTH_SURFACE))
    surface_free(global.GLR_DEPTH_SURFACE);

if(surface_exists(global.GLR_BLUR_SURFACE))
    surface_free(global.GLR_BLUR_SURFACE);

    
ds_list_destroy(global.GLR_SHADOWAREA_LIST);


ds_list_destroy(global.GLR_MESH_DYN_LIST);
ds_list_destroy(global.GLR_MESH_STC_LIST);

ds_list_destroy(global.GLR_MESH_SORTED_LIST);
 
ds_list_destroy(global.GLR_SPR_DYN_LIST);
ds_list_destroy(global.GLR_SPR_STC_LIST);

ds_list_destroy(global.GLR_DEP_DYN_LIST);
ds_list_destroy(global.GLR_DIR_CUSTOM_LIST);
ds_list_destroy(global.GLR_RECEIVER_LIST);
 
ds_list_destroy(global.GLR_LIGHT_LIST);
ds_list_destroy(global.GLR_LIGHT_LIST_SIMPLE);
ds_list_destroy(global.GLR_OCCLUSION_LIST);
ds_list_destroy(global.GLR_OCCLUSION_LIST_INST);
 
ds_list_destroy(global.GLR_DEBUG_OPTIONS);

ds_priority_destroy(global.GLR_DIRECTIONAL_QUEUE);
ds_priority_destroy(global.GLR_DIRECTIONAL_TEMP_QUEUE);
