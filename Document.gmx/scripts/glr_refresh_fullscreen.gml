///glr_refresh_fullscreen()

/*
    <=============== DESCRIPTION ===============>
        Use this function when you switch to 
        fullscreen/windowed
        or when android device loses/gains focus
    <===========================================>
*/


var light_list_size = ds_list_size(global.GLR_LIGHT_LIST);
for(var i = 0; i < light_list_size ; i++)
{
    l_id = global.GLR_LIGHT_LIST[| i];
    l_id[| GLR_LIGHT.is_clear] = false; 
}
