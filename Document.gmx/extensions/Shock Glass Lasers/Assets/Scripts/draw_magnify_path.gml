///draw_magnify_path(x offset,y offset,path,seglength,width,texture,texture_pixelwidth,texture_pixelheight,stretch %,color1,color2,alpha,weighting)
//By Ground Effect Games
//this script has a better magnification effect
//useful if you are drawing something that doesn't move around much

var pathlength=path_get_length(argument2);

if (pathlength>argument3)
{
    var seglength,width,xprev,yprev,x1,y1,x2,y2,dir,i,wx,wy,offset,lt;
    //returns a percentage of the path which makes up one segment of the drawing.
    seglength = argument3/pathlength;
    width=argument4*.5;
    offset=1;
    repeat(2)
    {
        //This section forms the outer edges of the beam
        xprev=argument0+path_get_x(argument2,1);
        yprev=argument1+path_get_y(argument2,1);
        draw_primitive_begin_texture(pr_trianglestrip,argument5)
        draw_vertex_texture_color(xprev,yprev,xprev/argument6,yprev/argument7,argument9,0);
        i=1-seglength;
        xprev=argument0+path_get_x(argument2,i);
        yprev=argument1+path_get_y(argument2,i);
        for (i=1-(2*seglength); i>0; i-=seglength;)
        {
            x1 = argument0+path_get_x(argument2,i);
            y1 = argument1+path_get_y(argument2,i);
            //calculate direction
            dir=point_direction(x1,y1,xprev,yprev)+90;
            //adjust x and y depending on weighting
            x1+=lengthdir_x(path_get_speed(argument2,i)*argument12,dir);
            y1+=lengthdir_y(path_get_speed(argument2,i)*argument12,dir);
            //set the width
            wx = lengthdir_x(offset*width,dir);
            wy = lengthdir_y(offset*width,dir);
            x2 = xprev+wx;
            y2 = yprev+wy;
            //draw one point on the edge, then another halfway
            draw_vertex_texture_colour(x2,y2,x2/argument6,y2/argument7,argument10,0);
            lt = width*argument8*.5;
            x2 = xprev+wx*.5;
            y2 = yprev+wy*.5;
            draw_vertex_texture_colour(x2,y2,(x2+lengthdir_x(lt,dir))/argument6,(y2+lengthdir_y(lt,dir))/argument7,argument9,argument11);
            xprev=x1;
            yprev=y1;
        }
        //add the last point. no need to go through the full loop.
        draw_vertex_texture_color(xprev,yprev,xprev/argument6,yprev/argument7,argument9,0);
        draw_primitive_end()
        
        //This section forms the middle of the beam
        xprev=argument0+path_get_x(argument2,1);
        yprev=argument1+path_get_y(argument2,1);
        draw_primitive_begin_texture(pr_trianglestrip,argument5)
        draw_vertex_texture_color(xprev,yprev,xprev/argument6,yprev/argument7,argument9,0);
        i=1-seglength;
        xprev=argument0+path_get_x(argument2,i);
        yprev=argument1+path_get_y(argument2,i);
        for (i=1-(2*seglength); i>0; i-=seglength;)
        {
            x1 = argument0+path_get_x(argument2,i);
            y1 = argument1+path_get_y(argument2,i);
            //calculate direction
            dir=point_direction(x1,y1,xprev,yprev)+90;
            //adjust x and y depending on weighting
            x1+=lengthdir_x(path_get_speed(argument2,i)*argument12,dir);
            y1+=lengthdir_y(path_get_speed(argument2,i)*argument12,dir);
            //set the width
            wx = lengthdir_x(offset*width,dir);
            wy = lengthdir_y(offset*width,dir);
            x2 = xprev+wx*.5;
            y2 = yprev+wy*.5;
            lt = width*argument8*.5;
            //draw one point on the edge, then another in the center of the path
            draw_vertex_texture_colour(x2,y2,(x2+lengthdir_x(lt,dir))/argument6,(y2+lengthdir_y(lt,dir))/argument7,argument9,argument11);
            draw_vertex_texture_colour(xprev,yprev,xprev/argument6,yprev/argument7,argument9,argument11);
            xprev=x1;
            yprev=y1;
        }
        //add the last point. no need to go through the full loop.
        draw_vertex_texture_color(xprev,yprev,xprev/argument6,yprev/argument7,argument9,0);
        draw_primitive_end()
        offset*=-1;
    }
}
