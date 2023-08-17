///glr_enable_directional(enable)

/*
    <=============== DESCRIPTION ===============>
        Enable or disable directional lighting
    <===============  ARGUMENTS  ===============>
        enabled: true or false
        
    <===============  EXAMPLE  ===============>
        glr_enable_directional(true);
    <===========================================>
*/

if(argument0 && !global.GLR_DIRECTIONAL_ENABLED && !surface_exists(global.GLR_DIRECTIONAL_SURFACE)){
    global.GLR_DIRECTIONAL_WIDTH = global.GLR_WIDTH*global.GLR_DIRECTIONAL_QUALITY;
    global.GLR_DIRECTIONAL_HEIGHT = global.GLR_HEIGHT*global.GLR_DIRECTIONAL_QUALITY;
    global.GLR_DIRECTIONAL_SURFACE = surface_create(global.GLR_DIRECTIONAL_WIDTH , global.GLR_DIRECTIONAL_HEIGHT);
} 

global.GLR_DIRECTIONAL_ENABLED = argument0;
 
