/// draw_faction_text(faction, description)

// Draw faction name.
draw_set_font(fntFaction)
draw_set_colour(c_white)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_text_transformed(72, 560, argument0, 1, 1, 0)

// Draw body text.
draw_set_font(fntTiny)
draw_text_ext_transformed(72, 600, argument1, 24, 672, 1, 1, 0)
