///path_random(x1,y1,x2,y2,path,segment length,tolerance,curl)
//By Ground Effect Games
//calculates the points needed for a lightning bolt and adds them to a path
//tolerance is the maximum number of degrees a segment may vary from a straight line
//curl determines how many degrees the lightning's average path will curve.
var xx,yy,dir,t;
xx=argument0;
yy=argument1;
//tolerance is limited in order to make the effect look nice and also use less CPU.
t=median(-60,argument6,60);
path_clear_points(argument4)
path_set_closed(argument4,0);
while (point_distance(xx,yy,argument2,argument3)>argument5)
{
    dir=point_direction(xx,yy,argument2,argument3)+argument7+tolerance(t);
    path_add_point(argument4,xx,yy,tolerance(t*argument5/30));
    xx+=lengthdir_x(argument5,dir);
    yy+=lengthdir_y(argument5,dir);
}
//stop the loop when the lightning reaches within one segment length of the target
path_add_point(argument4,argument2,argument3,0);
//add the last point manually, so the lightning hits the target pixel exactly
