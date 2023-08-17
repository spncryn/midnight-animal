///glr_shadowarea_update(id, width, height)

/*
    <=============== DESCRIPTION ===============>
        Recreate the shadowarea        
        
    <===============  ARGUMENTS  ===============>
        width: the new width of the area
        height: the new height of the area      
    <===========================================>
*/


var l = argument0,
w = argument1,
h = argument2;

vertex_delete_buffer(l[| GLR_SHADOWAREA.model_vertex_buffer]);

//create the new mesh 
buf = vertex_create_buffer();
 
vertex_begin(buf, global.GLR_MODEL_FORMAT);
    vertex_position(buf, 0, 0);
    vertex_position(buf, w, 0);
    vertex_position(buf, 0, h);
    vertex_position(buf, w, h);
vertex_end(buf); 

//workaround for the GM:HTML5 BUG
if(os_browser == browser_not_a_browser)
    vertex_freeze(buf);

    
l[| GLR_SHADOWAREA.model_vertex_buffer] = buf; 
