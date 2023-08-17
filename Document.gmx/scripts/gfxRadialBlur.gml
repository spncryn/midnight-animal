/// gfxRadialBlur(SurfaceBuffer, Type[0-2], Iterations, X, Y, Radius);
if(argument0!=-1 && argument2>0 && argument5>0){
    var SHADER, uTYPE, uRESPOS, uRADIUS, i;

    SHADER = shdRadialBlur;

    uTYPE = shader_get_uniform(SHADER,"TYPE");
    uRESPOS = shader_get_uniform(SHADER,"RESPOS");
    uRADIUS = shader_get_uniform(SHADER,"RADIUS");

    shader_set(SHADER);
    shader_set_uniform_f(uTYPE,clamp(argument1,0,2));
    shader_set_uniform_f(uRESPOS,surface_get_width(argument0),surface_get_height(argument0),argument3,argument4);

    for (i=0; i<argument2; i+=1){
        shader_set_uniform_f(uRADIUS,argument5/(9*(i+1)));
        surface_set_target(argument0);
        draw_surface(argument0,0,0);
        surface_reset_target();
    }

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
