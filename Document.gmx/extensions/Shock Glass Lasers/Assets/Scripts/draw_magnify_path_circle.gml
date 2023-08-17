///draw_magnify_path_circle(x,y,path,start,end,# polygons,texture,texture_pixelwidth,texture_pixelheight,stretch,twist,color,alpha)
//By Ground Effect Games
//where x and y are the absolute coordinates of pixels on your screen.
//this usually means you have to input x-view_xview, y-view_yview
//the center of the shield is at x,y.
//absolute coordinates from the path are used to place the texture on the rock.
//start and end are path positions between 1 and 0.
//twist is an absolute value. set it to image_angle,direction, or similar variable

if (argument5 && (argument4 > argument3))
{
    var seglength,xx,yy,zx,zy,dir;
    //returns a percentage of the path which makes up one segment.
    seglength = (argument4-argument3)/round(argument5);
    
    draw_primitive_begin_texture(pr_trianglestrip,argument6)
    for (i=argument3; i<=argument4; i+=seglength;)
    {
        //map points on the texture to the points on a path, with stretch and twist distortion
        zx=path_get_x(argument2,i);
        zy=path_get_y(argument2,i);
        xx=argument0+zx;
        yy=argument1+zy;
        draw_vertex_texture_colour(xx,yy,xx/argument7,yy/argument8,c_white,argument12);
        xx=argument0+zx/2;
        yy=argument1+zy/2;
        dir=(i*360)+argument10;
        draw_vertex_texture_colour(xx,yy,(xx+lengthdir_x(argument9,dir))/argument7,(yy+lengthdir_y(argument9,dir))/argument8,argument11,argument12);
    }
    draw_primitive_end()

    draw_primitive_begin_texture(pr_trianglefan,argument6)
    //the first point will be at the center.
    draw_vertex_texture_colour(argument0,argument1,argument0/argument7,argument1/argument8,argument11,argument12);
    for (i=argument3; i<=argument4; i+=seglength;)
    {
        //map points on the texture to the points on a path, with stretch and twist distortion
        xx=argument0+path_get_x(argument2,i)/2;
        yy=argument1+path_get_y(argument2,i)/2;
        dir=(i*360)+argument10;
        draw_vertex_texture_colour(xx,yy,(xx+lengthdir_x(argument9,dir))/argument7,(yy+lengthdir_y(argument9,dir))/argument8,argument11,argument12);
    }
    draw_primitive_end()
}
