//set up the particle system
global.partsys_fire = part_system_create()
part_system_depth(global.partsys_fire, -998)

//set up the basic fire particle
global.part_fire = part_type_create()

//how it looks
part_type_sprite(global.part_fire, sprTinyFlames, 0, 0, 1)
part_type_size(global.part_fire, 0.5, 1, -.05, 0)
part_type_scale(global.part_fire, 0.1, 0.1)
part_type_orientation(global.part_fire, 0, 360, 2, 0, 0)
part_type_color2(global.part_fire, c_orange, c_red)
part_type_alpha3(global.part_fire, 1, 1, 0)
part_type_blend(global.part_fire, 1)

//how it moves
part_type_direction(global.part_fire, 85, 95, 0, 0)
part_type_speed(global.part_fire, 2, 10, -.1, 0)

//how long it lasts
part_type_life(global.part_fire, 25, 35)

//set up an extra cinder particle for a nice added effect
global.part_cinder = part_type_create()

//how it looks
part_type_sprite(global.part_cinder, sprTinyCinders, 0, 0, 1)
part_type_size(global.part_cinder, 0.5, 1, -.001, 0)
part_type_scale(global.part_cinder, 0.1, 0.1)
part_type_orientation(global.part_cinder, 0, 360, .05, 0, 0)
part_type_color2(global.part_cinder, c_orange, c_red)
part_type_alpha3(global.part_cinder, 1, 1, 0)
part_type_blend(global.part_cinder, 1)

//how it moves
part_type_direction(global.part_cinder, 85, 125, .01, .01)
part_type_speed(global.part_cinder, 6, 8, 0, 0)

//how long it lasts
part_type_life(global.part_cinder, 45, 75)


//set up the particle emitter
my_emitter = part_emitter_create(global.partsys_fire)
part_emitter_region(global.partsys_fire,my_emitter,x,x,y,y,ps_shape_rectangle,ps_distr_linear)

