///glr_receiver_set_transform(id, x, y, xscale, yscale, rot)

/*
    <=============== DESCRIPTION ===============>
        Change the transform of the receiver
     
        NOTE: you can use ds accessors to
        speed up your code
        
    <===========================================>
*/

var l = argument0; 
l[| GLR_RECEIVER.px] = argument1;
l[| GLR_RECEIVER.py] = argument2;
l[| GLR_RECEIVER.xscale] = argument3;
l[| GLR_RECEIVER.yscale] = argument4; 
l[| GLR_RECEIVER.rotation] = argument5; 
