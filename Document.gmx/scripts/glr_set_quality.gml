///glr_set_quality(quality)


/*
    <=============== DESCRIPTION ===============>
        Set the main surface quality
        
    <===============  ARGUMENTS  ===============>
        quality: from 0 to 1
        
    <===============  EXAMPLE  ===============>
        glr_set_quality(0.5);
    <===========================================>
*/

global.GLR_MAIN_QUALITY = clamp(argument0, 0.05,1);

if(surface_exists(global.GLR_MAIN_SURFACE)) surface_free(global.GLR_MAIN_SURFACE);

global.GLR_MAIN_SURFACE_WIDTH = global.GLR_WIDTH*global.GLR_MAIN_QUALITY;
global.GLR_MAIN_SURFACE_HEIGHT = global.GLR_HEIGHT*global.GLR_MAIN_QUALITY;
global.GLR_MAIN_SURFACE = surface_create(global.GLR_MAIN_SURFACE_WIDTH , global.GLR_MAIN_SURFACE_HEIGHT);
 
//free the blur surface
if(surface_exists(global.GLR_BLUR_SURFACE))
{
    surface_free(global.GLR_BLUR_SURFACE);
    global.GLR_BLUR_SURFACE = -1;
}

buffer_delete(global.GLR_ILLUM_BUFFER);
global.GLR_ILLUM_BUFFER = buffer_create(global.GLR_MAIN_SURFACE_WIDTH*global.GLR_MAIN_SURFACE_HEIGHT*4, buffer_fixed, 4); 
