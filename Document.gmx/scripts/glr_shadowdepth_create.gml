///glr_shadowdepth_create(sprite, subimage, x, y, zdepth, xscale, yscale, rotation)

/*
    <=============== DESCRIPTION ===============>
        The shadowdepth is useful to simulate
        the layer of an object relative to a light.
        
        For example, if you have a tree and a player
        with a torchlight, the light does not affect
        the tree and pass through it. 
        
        In this case, simply set a shadowdepth on
        your three with zdepth greater then the
        light zdepth.
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite used as mask
        subimage: the number of the frame
        x: coordinate in world space
        y: coordinate in world space
        zdepth: depth from 0 to 16777215 (only integer numbers)
        xscale: scaling in x axis of the sprite
        yscale: scaling in y axis of the sprite
        rotation: angle of the sprite
    <===========================================>
*/

var l = ds_list_create();
l[| GLR_SHADOWDEPTH.active] = true;
l[| GLR_SHADOWDEPTH.sprite] = argument0;
l[| GLR_SHADOWDEPTH.subimage] = argument1;
l[| GLR_SHADOWDEPTH.px] = argument2;
l[| GLR_SHADOWDEPTH.py] = argument3;
l[| GLR_SHADOWDEPTH.zdepth] = argument4;
l[| GLR_SHADOWDEPTH.xscale] = argument5;
l[| GLR_SHADOWDEPTH.yscale] = argument6;
l[| GLR_SHADOWDEPTH.rotation] = argument7;

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);

l[| GLR_SHADOWDEPTH.bounding_circle] =  max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), 
    point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle


ds_list_add(global.GLR_DEP_DYN_LIST, l);
return l;
