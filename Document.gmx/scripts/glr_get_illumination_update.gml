///glr_get_illumination_update()

/*
    <=============== DESCRIPTION ===============>
        Updates the buffer used by 
        glr_get_illumination
        
        NOTE
        To improve performances use it only
        ONCE per frame
        
    <===========================================>
*/

//
buffer_get_surface(global.GLR_ILLUM_BUFFER, global.GLR_MAIN_SURFACE, 0, 0, 0);
 
