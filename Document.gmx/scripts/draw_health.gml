///draw_health(colour)
draw_set_alpha(hp_alpha)
draw_healthbar_circular(x ,y , 100, 100, global.nigredo, 18, 0.8, 4) // Back - static.
draw_healthbar_circular(x ,y , hp, max_hp, argument0, 18, 1, 4) // Actual health.
draw_reset()
