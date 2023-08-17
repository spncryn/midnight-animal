///glr_enable_blur(enabled)

/*
    <=============== DESCRIPTION ===============>
        Enable or disable soft shadows
    <===============  ARGUMENTS  ===============>
        enabled: true or false
    
    <===============  EXAMPLE  ===============>
        glr_enable_blur(true);
    <===========================================>
*/

global.GLR_BLUR_ENABLED = argument0;
if(!argument0){
    if(surface_exists(global.GLR_BLUR_SURFACE))
        surface_free(global.GLR_BLUR_SURFACE);
    global.GLR_BLUR_SURFACE = -1; 
}
