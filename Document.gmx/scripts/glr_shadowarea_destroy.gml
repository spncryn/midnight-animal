///glr_shadowarea_destroy(id)

/*
    <=============== DESCRIPTION ===============>
        Destroy the shadowarea with the given id
        
    <===============  ARGUMENTS  ===============>
        id: shadowarea id returned by glr_shadowarea_create
    <===========================================>
*/
var l = argument0;
vertex_delete_buffer(l[| GLR_SHADOWAREA.model_vertex_buffer]);
ds_list_delete(global.GLR_SHADOWAREA_LIST, ds_list_find_index(global.GLR_SHADOWAREA_LIST, l));
ds_list_destroy(l);
