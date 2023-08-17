///glr_directional_custom_set_sprite(id, sprite, subimage)
 
/*
    <=============== DESCRIPTION ===============>
        Change the sprite of the
        directional custom shadow
        
    <===============  ARGUMENTS  ===============>
        id: the directional custom shadow returned by glr_directional_custom_create
        sprite: the new sprite
        subimage: the new frame of the sprite
    <===========================================>
*/


var l = argument0;   
l[| GLR_DIRECTIONAL_CUSTOM.sprite] = argument1;
l[| GLR_DIRECTIONAL_CUSTOM.subimage] = argument2; 

var width = sprite_get_width(argument1);
var height = sprite_get_height(argument1);
var xo =  sprite_get_xoffset(argument1);
var yo =  sprite_get_yoffset(argument1);

l[| GLR_DIRECTIONAL_CUSTOM.bounding_circle] =  max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
    point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle
