///glr_mesh_update(mesh id)


/*
    <=============== DESCRIPTION ===============>
        Updates all mesh buffer and creates
        the real mesh and shadows
        Call this function when you update the
        vertices of your mesh and you want to
        save your changes
    <===============  ARGUMENTS  ===============>
        mesh: the mesh id
    <===========================================>
*/


if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


var mesh = argument0;
var mesh_list = mesh[| GLR_MESH.meshes];
var sz_mesh = ds_list_size(mesh_list);



var buf = mesh[| GLR_MESH.shadow_vertex_buffer];
if(buf != -1) vertex_delete_buffer(buf); 
buf = vertex_create_buffer();

vertex_begin(buf, global.GLR_VERTEX_FORMAT);

//bounding circle
var bcr = 0;

var shadow_triangles_count = 0;
var shadow_vertex_count = 0;

//add all submeshes
for(var n = 0; n < sz_mesh; n++)
{
    var submesh = mesh_list[| n];
    var vcount = ds_list_size(submesh);
    for(var i = 0; i <  vcount; i += 2)
    {
        var x1 = submesh[| (i    )% vcount];
        var y1 = submesh[| (i + 1)% vcount];
        var x2 = submesh[| (i + 2)% vcount];
        var y2 = submesh[| (i + 3)% vcount]; 
        
        vertex_position_3d(buf, x1, y1, 1);
        vertex_position_3d(buf, x2, y2, 0);
        vertex_position_3d(buf, x2, y2, 1);
        
        vertex_position_3d(buf, x1, y1, 0);
        vertex_position_3d(buf, x2, y2, 0);
        vertex_position_3d(buf, x1, y1, 1);
        
        //calculate bounding circle
        bcr = max(bcr, point_distance(0, 0, x1, y1));
    }
    
    shadow_triangles_count += vcount;
    shadow_vertex_count += vcount / 2;
    if(debug_mode)
    {
        if(os_browser != browser_not_a_browser)
        {
            if(shadow_triangles_count*6 > 999){
                show_message(global.GLR_ERROR_VERTEX_COUNT);
                break
            }
            
        }
    }
}
vertex_end(buf);

mesh[| GLR_MESH.shadow_triangles_count] = shadow_triangles_count;
mesh[| GLR_MESH.shadow_vertex_count] = shadow_vertex_count;

//workaround for the HTML5 module bug
if(os_browser == browser_not_a_browser)
    vertex_freeze(buf);
    
mesh[| GLR_MESH.shadow_vertex_buffer] = buf;

mesh[| GLR_MESH.bounding_circle] = bcr; 
mesh[| GLR_MESH.bcircle] = bcr * max(mesh[| GLR_MESH.xscale], mesh[| GLR_MESH.yscale]);

//Create the depth mesh
var triangles = ds_list_create();
var l = ds_list_create();

var x1,y2, x2,y2, x3,y3;
var i;
    
for(var n = 0; n < sz_mesh; n++)
{ 
    var submesh = mesh_list[| n];
    var vcount = ds_list_size(submesh);
    
    ds_list_clear(l);
    ds_list_copy(l, submesh );
    sz = ds_list_size(l);
    
    var first_cw = -1;
    var cw = 0;
    var ccw = 0; 
    //check clockwiseness of the mesh
    for(i = 0; i< sz; i+=2){ 
        x1 =  l[| (i    ) % sz];   y1 =  l[| (i + 1) % sz];
        x2 =  l[| (i + 2) % sz];   y2 =  l[| (i + 3) % sz];
        x3 =  l[| (i + 4) % sz];   y3 =  l[| (i + 5) % sz];
        var dot = (x2-x1)*(y3-y1) - (y2-y1)*(x3-x1);
        if(dot > 0){
            cw++;
        }
        else if(dot < 0){
            ccw++;
        }
    }
    var mesh_clockwise = 1;
      
    if(cw < ccw){
        mesh_clockwise = -1;
    }
    else if (cw == ccw){
        x1 =  l[| 0];  y1 =  l[| 1];
        x2 =  l[| 2];  y2 =  l[| 3];
        x3 =  l[| 4];  y3 =  l[| 5];
        if( (x2-x1)*(y3-y1) - (y2-y1)*(x3-x1) < 0){
            mesh_clockwise = -1; 
        }
    }
        
        
    //triangulate the mesh
    var cx, cy;
    i=0;
    sz = ds_list_size(l);
    while(sz >= 6)
    {
        x1 =  l[| (i    ) % sz];  y1 =  l[| (i + 1) % sz];
        x2 =  l[| (i + 2) % sz];  y2 =  l[| (i + 3) % sz];
        x3 =  l[| (i + 4) % sz];  y3 =  l[| (i + 5) % sz];
          
        
        //if counter clockwise
        if(((x2-x1)*(y3-y1) - (y2-y1)*(x3-x1))*mesh_clockwise > 0)
        {
            //check if not point in triangle
              
            var in_tris = false;
            var point_count = (sz - 6)/2;
            var j = i + 6;
            repeat(point_count)
            {
                if(point_in_triangle(l[| j % sz], l[| (j + 1) % sz], x1, y1, x2, y2, x3, y3))
                {
                    in_tris = true;
                    break; 
                }
                j += 2;
            }
            if(in_tris)
            {
                i+=2;   
            }
            else{
                ds_list_add(triangles,  x1, y1, x2, y2, x3, y3 );
                 
                ds_list_delete(l,(i + 2) % sz); 
                ds_list_delete(l,(i + 2) % sz); 
                sz = ds_list_size(l);
            }
            
        }
        else
        {
            i+=2; 
        }
    }  
}
 
var buf = mesh[| GLR_MESH.model_vertex_buffer];
if(buf != -1) vertex_delete_buffer(buf); 
buf = vertex_create_buffer();

vertex_begin(buf, global.GLR_MODEL_FORMAT);
 
sz = ds_list_size(triangles);

if(debug_mode)
{
    if(os_browser != browser_not_a_browser)
    {
        if(sz > 999)
            show_message(global.GLR_ERROR_VERTEX_COUNT);
    }
}
    
for(i = 0; i< sz; i+=2){
    x1 =  triangles[| i    ];
    y1 =  triangles[| i + 1];
    vertex_position(buf, x1, y1);
}
vertex_end(buf);

//workaround for the GM:HTML5 BUG
if(os_browser == browser_not_a_browser)
    vertex_freeze(buf);
    
mesh[| GLR_MESH.model_vertex_buffer] = buf;
mesh[| GLR_MESH.model_triangles_count] = sz/3;


ds_list_destroy(triangles);
ds_list_destroy(l); 
