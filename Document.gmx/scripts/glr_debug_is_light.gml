///glr_debug_is_light(light)

/*
    <=============== DESCRIPTION ===============>
        Check if the argument0 is a valid light
        
    <===============  ARGUMENTS  ===============>
        light: the light to check
    <===============  EXAMPLE  ===============>
        valid = glr_debug_check_light(light);
    <===========================================>
*/

if(!ds_exists(argument0, ds_type_list))
{
    return 0;
}
else if(argument0[| GLR_LIGHT.type] != GLR_TYPE.light)
{
   return 0;
}

return 1;
