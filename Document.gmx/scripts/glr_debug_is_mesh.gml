///glr_debug_is_mesh(mesh)

/*
    <=============== DESCRIPTION ===============>
        Check if the argument0 is a valid mesh
        
    <===============  ARGUMENTS  ===============>
        mesh: the mesh to check
    <===============  EXAMPLE  ===============>
        valid = glr_debug_is_mesh(mesh);
    <===========================================>
*/

if(!ds_exists(argument0, ds_type_list))
{
    return 0;
}
else if(argument0[| GLR_MESH.type] != GLR_TYPE.mesh)
{
   return 0;
}

return 1;
