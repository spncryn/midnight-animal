///glr_shadowarea_destroy_all()

/*
    <=============== DESCRIPTION ===============>
        Destroy  all shadowareas
    <===========================================>
*/

var l,
sz = ds_list_size(global.GLR_SHADOWAREA_LIST);
  
for(var i = 0; i < sz; i++){
    l = global.GLR_SHADOWAREA_LIST[| i];
    d3d_model_destroy(l[| GLR_SHADOWAREA.model_vertex_buffer]);
    ds_list_destroy(l);
}
ds_list_clear(global.GLR_SHADOWAREA_LIST);
