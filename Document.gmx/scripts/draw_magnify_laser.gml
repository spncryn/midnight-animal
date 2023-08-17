///draw_magnify_laser(x1,y1,x2,y2,width,texture,texture_pixel_width,texture_pixel_height,pixelstretch,cap,color1,color2,alpha1,alpha2)
//by Ground Effect Games
//we are creating a bilinear gradient with trianglular end caps so there isn't a flat end.

var length=point_distance(argument0,argument1,argument2,argument3);
if (length>1)
{
    var width,texture,angle,i;
    angle=point_direction(argument0,argument1,argument2,argument3);
    width=argument4*.5;//we are starting in the middle of the laser and drawing two halves

    if (argument9<1)//if the user doesn't want end caps, skip them.
    {
        i=90;
        repeat(2)
        {
            draw_primitive_begin_texture(pr_trianglestrip,argument5)//change to pr_linestrip to debug
            //middle of the laser has max distortion and alpha
            xx=argument0;
            yy=argument1;//middle starting point
            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(argument8,angle+90))/argument6,(yy+lengthdir_y(argument8,angle+90))/argument7,argument10,argument12)
            //outer edge at the starting point. has no distortion and no alpha
            xx+=lengthdir_x(width,angle+i);
            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,argument11,0)
            //middle of the ending point
            xx=argument2;
            yy=argument3;//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(argument8,angle+90))/argument6,(yy+lengthdir_y(argument8,angle+90))/argument7,argument10,argument13)
            //outer edge of the ending point
            xx+=lengthdir_x(width,angle+i);
            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,argument11,0)
            draw_primitive_end();
            i=-i;
        }
    }
    else//if the user wants end caps
    {
        var side=argument9*4;
        i=90;
        repeat(2)
        {
            draw_primitive_begin_texture(pr_trianglestrip,argument5)//change to pr_linestrip to debug
            //end cap forms a triangular point at the beginning and end
            xx=argument0+lengthdir_x(-side,angle);
            yy=argument1+lengthdir_y(-side,angle);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,argument11,0)
            //middle of the laser has max distortion and alpha
            xx=argument0;
            yy=argument1;//middle starting point
            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(argument8,angle+90))/argument6,(yy+lengthdir_y(argument8,angle+90))/argument7,argument10,argument12)
            //outer edge at the starting point. has no distortion and no alpha
            xx+=lengthdir_x(width,angle+i);
            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,argument11,0)
            //middle of the ending point
            xx=argument2;
            yy=argument3;//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,(xx+lengthdir_x(argument8,angle+90))/argument6,(yy+lengthdir_y(argument8,angle+90))/argument7,argument10,argument13)
            //outer edge of the ending point
            xx+=lengthdir_x(width,angle+i);
            yy+=lengthdir_y(width,angle+i);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,argument11,0)
            //end cap of the ending point
            xx=argument2+lengthdir_x(side,angle);
            yy=argument3+lengthdir_y(side,angle);//coordinates of the point to be added
            draw_vertex_texture_color(xx,yy,xx/argument6,yy/argument7,c_white,0)
            draw_primitive_end();
            i=-i;
        }
    }
}
