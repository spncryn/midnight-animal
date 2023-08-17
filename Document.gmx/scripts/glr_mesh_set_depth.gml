///glr_mesh_set_depth(mesh, depth)

/*
    <=============== DESCRIPTION ===============>
        Set the mesh depth to enable the
        depth ordered shadow rendering
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
        depth: from 0 to 16777215 (only integer numbers)
    <===========================================>
*/

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
var dep = clamp(floor(argument1), 0, global.GLR_MAX_DEPTH);

mesh[| GLR_MESH.zdepth] = dep;

//delete from the list
var index = ds_list_find_index(global.GLR_MESH_SORTED_LIST, mesh);
if(index >= 0)
    ds_list_delete(global.GLR_MESH_SORTED_LIST, index);

    
//insert in sorted depth list only if depth > 0
if(dep > 0)
{
    var sz = ds_list_size(global.GLR_MESH_SORTED_LIST);
     
    if(sz > 0)
    { 
        var found = false;
        for(var i=0; i< sz; i++)
        {
            var list = global.GLR_MESH_SORTED_LIST[| i];
            if(list[| GLR_MESH.zdepth] <= dep)
            {
                ds_list_insert(global.GLR_MESH_SORTED_LIST, i, mesh);
                found = true;
                break;
            }
        }
        if(!found)
            ds_list_add(global.GLR_MESH_SORTED_LIST, mesh);  
    }
    else
    {
        ds_list_add(global.GLR_MESH_SORTED_LIST, mesh);
    }
}
