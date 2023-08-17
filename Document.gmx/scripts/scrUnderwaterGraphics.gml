if surface_exists(argument0) {
    var SHADER, sNMTEX, uCOLOR, uRESSIZE, uTHPW, RESWIDTH, RESHEIGHT;

    SHADER = shdWaterSurface

    sNMTEX = shader_get_sampler_index(SHADER,'NMTEX')
    uCOLOR = shader_get_uniform(SHADER,'COLOR')
    uRESSIZE = shader_get_uniform(SHADER,'RESSIZE')
    uTHPW = shader_get_uniform(SHADER,'THPW')

    RESWIDTH = surface_get_width(argument0)
    RESHEIGHT = surface_get_height(argument0)

    shader_set(SHADER)
    texture_set_stage(sNMTEX,argument1)
    shader_set_uniform_f(uCOLOR,argument2,argument3,argument4)
    shader_set_uniform_f(uRESSIZE,RESWIDTH,RESHEIGHT,argument5)
    shader_set_uniform_f(uTHPW,argument6,argument7)

    surface_set_target(argument0)
    draw_surface(argument0,0,0)
    surface_reset_target()

    shader_reset()

    surface_set_target(argument0)
    surface_reset_target()
}
