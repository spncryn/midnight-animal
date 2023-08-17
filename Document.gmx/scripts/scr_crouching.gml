///Crouching

//scr_crouching(true_false);

var a;

b_crouch = argument0;

if (argument0){
    a = 1;
}else{
    a = -1;
}

x += lengthdir_x(a * 5, image_angle);
y += lengthdir_y(a * 5, image_angle);
while(place_meeting(x, y, par_coll)){
    x -= lengthdir_x(a, image_angle);
    y -= lengthdir_y(a, image_angle);   
}
