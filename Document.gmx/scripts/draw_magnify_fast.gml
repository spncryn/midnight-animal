///draw_magnify_fast(x,y,radius,# polygons,texture,texture pixelwidth,texture pixelheight,pixels stretch,degrees twist)
//by Ground Effect Games
//This faster version is not HTML5 compatible because it uses a trianglfan primitive.
//This is specifically designed for use with the application surface.
//The x and y values are absolute values of pixels on your display, NOT in the room!
//if you need alpha or coloring, use draw_set_alpha and draw_set_color

//you can't draw a shape with less than three sides (circles are polygons)
if (argument3>=3)
{
    var xx,yy,r2,side,i,texture_angle;
    //slopes up to full magnification at half of the radius
    r2=argument2*.5;
    
    //we are drawing a polygon with the number of sides given in argument8
    //The number of sides cannot physically exceed the circumference of the circle.
    side=360/round(argument3);
    
    //change to pr_linestrip to debug
    draw_primitive_begin_texture(pr_trianglestrip,argument4)
    for (i=image_angle-360;i<=image_angle;i+=side)
    {
        texture_angle=i-argument8;
        xx=argument0+lengthdir_x(argument2,i);
        yy=argument1+lengthdir_y(argument2,i);
        
        //outer circle of points has no magnification or twist
        draw_vertex_texture_color(xx,yy,xx/argument5,yy/argument6,c_white,0)
        
        xx-=lengthdir_x(r2,i);
        yy-=lengthdir_y(r2,i);
        
        //middle circle of points twists and stretches the texture, causing magnification.
        draw_vertex_texture(xx,yy,(xx-lengthdir_x(argument7,texture_angle))/argument5,(yy-lengthdir_y(argument7,texture_angle))/argument6)
    }
    draw_primitive_end();
    
    //There's only one point in the center of the circle. trianglefan is NOT HTML5 compatible.
    draw_primitive_begin_texture(pr_trianglefan,argument4)
    draw_vertex_texture(argument0,argument1,argument0/argument5,argument1/argument6)
    for (i=image_angle-360;i<=image_angle;i+=side)
    {
        texture_angle=i-argument8;
        xx=argument0+lengthdir_x(r2,i);
        yy=argument1+lengthdir_y(r2,i);
        
        //middle circle of points twists and stretches the texture, causing magnification.
        draw_vertex_texture(xx,yy,(xx-lengthdir_x(argument7,texture_angle))/argument5,(yy-lengthdir_y(argument7,texture_angle))/argument6)
    }
    draw_primitive_end();
}
