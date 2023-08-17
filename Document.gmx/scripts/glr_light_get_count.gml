///glr_light_get_count();

/*
    <=============== DESCRIPTION ===============>
        Returns the total number of lights
            
    <================  EXAMPLE  ================>
        count = glr_light_get_count(light);
    <===========================================>
*/
 

return ds_list_size(global.GLR_LIGHT_LIST);
