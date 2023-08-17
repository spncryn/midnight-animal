///glr_shadowdepth_set_sprite(id, sprite, subimage)
 
/*
    <=============== DESCRIPTION ===============>
        Change the sprite of the shadowdepth
        
    <===============  ARGUMENTS  ===============>
        id: the shadowdepth returned by glr_shadowdepth_create
        sprite: the new sprite
        subimage: the new frame of the sprite
    <===========================================>
*/


var l = argument0;   
l[| GLR_SHADOWDEPTH.sprite] = argument1;
l[| GLR_SHADOWDEPTH.subimage] = argument2; 

var width = sprite_get_width(argument1);
var height = sprite_get_height(argument1);
var xo =  sprite_get_xoffset(argument1);
var yo =  sprite_get_yoffset(argument1);

l[| GLR_SHADOWDEPTH.bounding_circle] =  max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
    point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle
