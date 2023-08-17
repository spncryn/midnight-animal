///glr_enable_occlusion(enable)

/*
    <=============== DESCRIPTION ===============>
        Enable or disable ambient occlusion
    <===============  ARGUMENTS  ===============>
        enabled: true or false
        
    <===============  EXAMPLE  ===============>
        glr_enable_occlusion(true);
    <===========================================>
*/


if(argument0 && !global.GLR_OCCLUSION_ENABLED && !surface_exists(global.GLR_DEPTH_SURFACE)){ 
    global.GLR_DEPTH_SURFACE = surface_create(global.GLR_MAIN_SURFACE_WIDTH , global.GLR_MAIN_SURFACE_HEIGHT);
}

global.GLR_OCCLUSION_ENABLED = argument0;
 
