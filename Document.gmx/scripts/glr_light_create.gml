///glr_light_create(sprite, subimg, x, y, color, intensity)

/*
    <=============== DESCRIPTION ===============>
        Creates a new Light
        
    <===============  ARGUMENTS  ===============>
        sprite: the sprite mask of the light
        subimg: the subimage of the sprite
        x: the x position
        y: the y position
        color: the color of the light
        intensity: the brightness from 0 to 1
        
        NB: the intensity value is only active
        if you use glr_draw_gamma(...)
        and NOT glr_draw(...)
    
    <===============  EXAMPLE  ===============>
        light = glr_light_create(spr_light_mask_point, 0, x, y, c_white, 0.2);
    <===========================================>
*/


var l = ds_list_create();
repeat(GLR_LIGHT.info_size){
    ds_list_add(l, 0);
}
l[| GLR_LIGHT.type] = GLR_TYPE.light;
l[| GLR_LIGHT.active] = true; //active

l[| GLR_LIGHT.static] = false; //static

//transform
l[| GLR_LIGHT.px] = argument2;  //x
l[| GLR_LIGHT.py] = argument3;  //y
l[| GLR_LIGHT.rotation] = 0;  //rotation
l[| GLR_LIGHT.xscale] = 1;  //xscale
l[| GLR_LIGHT.yscale] = 1;  //yscale


var intensity = max(0, argument5);
//light info
l[| GLR_LIGHT.color] = argument4;  //color
l[| GLR_LIGHT.intensity] = intensity;  //intensity
l[| GLR_LIGHT.sprite] = argument0;  //sprite
l[| GLR_LIGHT.subimage] = argument1;  //sprite index  
l[| GLR_LIGHT.layer] = 0; 
l[| GLR_LIGHT.zdepth] = 50000;  

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var xo =  sprite_get_xoffset(argument0);
var yo =  sprite_get_yoffset(argument0);


l[| GLR_LIGHT.xoffset] = xo;  //xoffset
l[| GLR_LIGHT.yoffset] = yo;  //yoffset


var bcircle = max( point_distance(0, 0, xo, yo), point_distance(width, 0, xo, yo), point_distance(width, height, xo, yo), point_distance(0, height, xo, yo)); //bounding circle
l[| GLR_LIGHT.bounding_circle] = bcircle;
l[| GLR_LIGHT.bcircle]  = bcircle; //pre computed bounding circle
//surfaces
l[| GLR_LIGHT.surf_light] = surface_create(width, height);//light surface
l[| GLR_LIGHT.surf_shadowmap] = -1;  //shadowmap
l[| GLR_LIGHT.surf_shadowsprite1] = surface_create(width, height);  //shadowsprite
l[| GLR_LIGHT.surf_shadowsprite2] = surface_create(width, height);  //shadowsprite2
 
l[| GLR_LIGHT.is_clear] = false;  //is clear
l[| GLR_LIGHT.shadow_strength] = 1;  //shadow strength
l[| GLR_LIGHT.tolerance] = 30;  //tolerance 


var mtx_offset = matrix_build(-xo, -yo, 0, 0, 0, 0, width, height, 1);
l[| GLR_LIGHT.matrix_offset] = 0;
l[| GLR_LIGHT.matrix] = 0;


ds_list_delete(l, GLR_LIGHT.matrix_offset);
ds_list_insert(l, GLR_LIGHT.matrix_offset, mtx_offset);


ds_list_delete(l, GLR_LIGHT.matrix);
ds_list_insert(l, GLR_LIGHT.matrix, matrix_multiply(mtx_offset, matrix_build(argument2, argument3, 0, 0, 0, 0, 1, 1, 1))) ;
 

l[| GLR_LIGHT.outofview] = false;
 

ds_list_add(global.GLR_LIGHT_LIST, l);

return l;
