///glr_directional_custom_set_depth(id, depth)

/*
    <=============== DESCRIPTION ===============>
        Change the depth of the directional
        custom shadow
        
        HINT:
        you can use GM:Studio ds accessors!
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned byglr_directional_custom_create
        zdepth: depth value from 0 to 16777215 (only integer numbers)
    <===========================================>
*/


var l = argument0;   
var dep = max(0, argument1);
l[| GLR_DIRECTIONAL_CUSTOM.zdepth] = dep;

   
//insert in sorted depth list only if depth > 0

var sz = ds_list_size(global.GLR_MESH_SORTED_LIST);
 
if(sz > 0)
{ 
    var found = false;
    for(var i=0; i< sz; i++)
    {
        var list = global.GLR_MESH_SORTED_LIST[| i];
        if(list[| GLR_DIRECTIONAL_CUSTOM.zdepth] <= dep)
        {
            ds_list_insert(global.GLR_MESH_SORTED_LIST, i, l);
            found = true;
            break;
        }
    }
    if(!found)
        ds_list_add(global.GLR_MESH_SORTED_LIST, l);  
}
else
    ds_list_add(global.GLR_MESH_SORTED_LIST, l);
