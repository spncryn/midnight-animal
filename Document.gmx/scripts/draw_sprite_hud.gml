/// draw_sprite_hud(sprite, subimg, x, y, xscale, yscale, angle)
draw_sprite_ext(argument0, argument1, argument2 + (global.deathshake / 3 * choose(-1, 1)), argument3 + (global.deathshake / 3 * choose(-1, 1)), argument4, argument5, argument6, global.citrinitas, 0.3)  
draw_sprite_ext(argument0, argument1, argument2 - (global.deathshake / 3 * choose(-1, 1)), argument3 - (global.deathshake / 3 * choose(-1, 1)), argument4, argument5, argument6, global.rubedo, 0.3)  
draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, merge_colour(global.albedo, cflash, hudflash / 10), 1)
