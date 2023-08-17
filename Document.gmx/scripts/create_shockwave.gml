///create_shockwave(x,y,start radius,end radius,update speed,expansion rate %,spin,twist,color1,color2,color3,alpha)
//syntax: x,y,starting radius, ending radius, steps between updates of the drawing,expansion rate in % of the radius, spin speed of the shockwave mesh(degrees per step), twist (distortion of the texture, in degrees), inner color, middle color, outer color, alpha
var shockwave=instance_create(argument0,argument1,o_shockwave)
with shockwave
{
    radius=argument2;
    targetradius=argument3;
    update_speed=argument4;
    alarm[0]=update_speed;
    sp=argument5;
    spin=argument6;
    twist=argument7;
    c1=argument8;
    c2=argument9;
    c3=argument10;
    image_alpha=argument11;
    debug=0;
    texture=surface_get_texture(application_surface);
}
return shockwave;
