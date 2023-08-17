///glr_shadowsprite_set_layer(id, layer)

/*
    <=============== DESCRIPTION ===============>
        Sets the shadowsprite layer.
        if the mesh layer is greater then a 
        light layer, this shadowsprite will not cast
        shadows from that light
    
    <===============  ARGUMENTS  ===============>
        id: the shadowsprite id returned by glr_shadowsprite_create
        layer: floating point number (also negative)
    <===========================================>
*/

var l = argument0;
l[| GLR_SHADOWSPRITE.layer] = argument1;
