///glr_receiver_get_active(id)

/*
    <=============== DESCRIPTION ===============>
        return true if the receiver with
        the given id is active
        
    <===============  ARGUMENTS  ===============>
        id: receiver id returned by glr_receiver_create     
    <===========================================>
*/

var l = argument0; 
return l[| GLR_RECEIVER.active];
