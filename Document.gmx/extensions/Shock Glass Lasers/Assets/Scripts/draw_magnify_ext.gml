///draw_magnify_ext(x,y,radius,# polygons,texture,texture_pixelwidth,texture_pixelheight,pixels_stretch,degrees_twist,color1,color2,color3,alpha1,alpha2,alpha3)
//by Ground Effect Games
//designed to run in the draw gui event, using a texture generated from the application surface or same sized surface
//to understand how this works, you need to know polar coordinates
//we are actually drawing a stack of two n-sided polygons that approximate a 3D sphere.
//only draw if we have enough triangles.
if (argument3>=3)
{
    var side,r1,r2,xx,yy,texture_angle,i;
    
    //we can do some calculations outside the loop to save CPU.
    
    //The number of sides cannot physically exceed the circumference of the circle.
    //also, we round the number of sides to prevent a loss in precision of the drawing.
    side=360/round(argument3);
    //r1 is the middle radius, where the texture is stretched and twisted the most.
    r1=argument2*.5;
    //this variable stretches the texture
    r2=r1-argument7;
    
    //change to pr_linestrip to debug
    draw_primitive_begin_texture(pr_trianglestrip,argument4)
    //This loop draws a donut
    for (i=image_angle-360;i<=image_angle;i+=side)
    {
        texture_angle=i-argument8;
        xx=argument0+lengthdir_x(argument2,i);
        yy=argument1+lengthdir_y(argument2,i);
        
        //outer circle of points has no magnification or twist
        draw_vertex_texture_color(xx,yy,xx/argument5,yy/argument6,argument11,argument14)
        xx-=lengthdir_x(r1,i);
        yy-=lengthdir_y(r1,i);
        
        //middle circle of points twists and stretches the texture, causing magnification.
        draw_vertex_texture_color(xx,yy,(argument0+lengthdir_x(r2,texture_angle))/argument5,(argument1+lengthdir_y(r2,texture_angle))/argument6,argument10,argument13)
    }
    
    //this loop fills the donut hole. The two layers work together to produce a 3D illusion.
    for (i=image_angle-360;i<=image_angle;i+=side)
    {
        texture_angle=i-argument8;
        //middle circle of points twists and stretches the texture, causing magnification.
        draw_vertex_texture_color(argument0+lengthdir_x(r1,i),argument1+lengthdir_y(r1,i),(argument0+lengthdir_x(r2,texture_angle))/argument5,(argument1+lengthdir_y(r2,texture_angle))/argument6,argument10,argument13)
        //there is only one point in the center
        draw_vertex_texture_color(argument0,argument1,argument0/argument5,argument1/argument6,argument9,argument12)
    }
    draw_primitive_end();
}
