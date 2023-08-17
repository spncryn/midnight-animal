///glr_shadowarea_create(x, y, width, height, illumination)


/*
    <=============== DESCRIPTION ===============>
        Creates an area that is always in shadow
        for directional light
        
        For example, in a topview game, you can
        create the interior of an house
        
        you can use the illumination value to
        increase the brightness of this area
        
        
    <===============  ARGUMENTS  ===============>
        x: the x coordinate in world space
        y: the y coordinate in world space
        width: the width of the area
        height: the height of the area
        illumination: the brightness of the area (from 0 to 1)
        
    <===========================================>
*/

var l = ds_list_create();

var px = argument0,
py = argument1,
w = argument2,
h = argument3,
illumination = argument4;

l[| GLR_SHADOWAREA.active] = true;
l[| GLR_SHADOWAREA.px] = px;
l[| GLR_SHADOWAREA.py] = py;
l[| GLR_SHADOWAREA.illumination] = illumination;

//create the mesh 
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

ds_list_add(global.GLR_SHADOWAREA_LIST, l);

return l;
