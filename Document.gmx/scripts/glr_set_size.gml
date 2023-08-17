///glr_set_size(width, height)

/*
    <=============== DESCRIPTION ===============>
        Set the surfaces resolution
        
    <===============  ARGUMENTS  ===============>
        width: width of area in pixel
        height: height of area in pixel
        
    <===============  EXAMPLE  ===============>
        glr_set_size(view_wview, view_hview);
    <===========================================>
*/

var s_width=argument0;
var s_height=argument1;

if(surface_exists(global.GLR_MAIN_SURFACE))
    surface_free(global.GLR_MAIN_SURFACE);


global.GLR_WIDTH = s_width;
global.GLR_HEIGHT = s_height;

global.GLR_MAIN_SURFACE_WIDTH = s_width*global.GLR_MAIN_QUALITY;
global.GLR_MAIN_SURFACE_HEIGHT = s_height*global.GLR_MAIN_QUALITY;
global.GLR_MAIN_SURFACE = surface_create(global.GLR_MAIN_SURFACE_WIDTH , global.GLR_MAIN_SURFACE_HEIGHT); 


global.GLR_DIRECTIONAL_WIDTH = s_width*global.GLR_DIRECTIONAL_QUALITY;
global.GLR_DIRECTIONAL_HEIGHT = s_height*global.GLR_DIRECTIONAL_QUALITY;
    
if(surface_exists(global.GLR_DIRECTIONAL_SURFACE))
{
    surface_resize(global.GLR_DIRECTIONAL_SURFACE, global.GLR_DIRECTIONAL_WIDTH , global.GLR_DIRECTIONAL_HEIGHT);
}

 
if(surface_exists(global.GLR_DEPTH_SURFACE))
{
    surface_resize(global.GLR_DEPTH_SURFACE, global.GLR_MAIN_SURFACE_WIDTH, global.GLR_MAIN_SURFACE_HEIGHT);
}
 
if(surface_exists(global.GLR_BLUR_SURFACE))
{
    surface_resize(global.GLR_BLUR_SURFACE, global.GLR_MAIN_SURFACE_WIDTH, global.GLR_MAIN_SURFACE_HEIGHT);
}




buffer_delete(global.GLR_ILLUM_BUFFER);
global.GLR_ILLUM_BUFFER = buffer_create(global.GLR_MAIN_SURFACE_WIDTH*global.GLR_MAIN_SURFACE_HEIGHT*4, buffer_fixed, 4); 
