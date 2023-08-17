///glr_set_directional_quality(quality)


/*
    <=============== DESCRIPTION ===============>
        Set the directional light quality
        
    <===============  ARGUMENTS  ===============>
        quality: from 0 to 1
        
    <===============  EXAMPLE  ===============>
        glr_set_directional_quality(0.75);
    <===========================================>
*/


global.GLR_DIRECTIONAL_QUALITY = clamp(argument0, 0.05,1);

if(surface_exists(global.GLR_DIRECTIONAL_SURFACE)){ 
    global.GLR_DIRECTIONAL_WIDTH = global.GLR_WIDTH*global.GLR_DIRECTIONAL_QUALITY;
    global.GLR_DIRECTIONAL_HEIGHT = global.GLR_HEIGHT*global.GLR_DIRECTIONAL_QUALITY;
    surface_resize(global.GLR_DIRECTIONAL_SURFACE, global.GLR_DIRECTIONAL_WIDTH , global.GLR_DIRECTIONAL_HEIGHT);
}
