///glr_shadowsprite_set_static(id, static)

/*
    <=============== DESCRIPTION ===============>
        Sets the shadowsprite as static or dynamic
        
        true for static, false for dynamic
    
    <===============  ARGUMENTS  ===============>
        id: the shadowsprite id returned by glr_shadowsprite_create
        static: true if static
    <===========================================>
*/


var l = argument0;
var is_static = l[| GLR_SHADOWSPRITE.static];

if(is_static){
    ds_list_delete(global.GLR_SPR_STC_LIST, ds_list_find_index(global.GLR_SPR_STC_LIST, l));
}
else{
    ds_list_delete(global.GLR_SPR_DYN_LIST, ds_list_find_index(global.GLR_SPR_DYN_LIST, l));
}

if(argument1)
    ds_list_add(global.GLR_SPR_STC_LIST, l);
else
    ds_list_add(global.GLR_SPR_DYN_LIST, l);
    
l[| GLR_SHADOWSPRITE.static] = argument1;
