///glr_receiver_set_active(id, active)

/*
    <=============== DESCRIPTION ===============>
        activate or deactivate the shadow receiver    
        
    <===============  ARGUMENTS  ===============>
        id: receiver id returned by glr_receiver_create  
        active: true or false  
    <===========================================>
*/

var l = argument0; 
l[| GLR_RECEIVER.active] = argument1;
