/// draw_character_text(faction, description, name, title, subtitle, text)

/******FACTION******/

// Draw faction name.
draw_set_font(fntFaction)
draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_text_transformed(72, 728, argument0, 1, 1, 0)

// Draw faction text.
draw_set_font(fntTiny)
draw_text_ext_transformed(72, 768, argument1, 28, 720, 1, 1, 0)

/******CHARACTER******/

// Draw character name.
draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_font(fntFaction)
draw_text_transformed(1088, 96 - 32, argument2, 1, 1, 0)

// Draw character title.
draw_set_font(fntTiny)
draw_text_transformed(1088, 132 - 32, argument3, 1, 1, 0)

// Draw character subtitle.
draw_set_font(fntTinyItalics)
draw_text_transformed(1088, 152 - 32, argument4, 1, 1, 0)

// Draw character text.
draw_set_font(fntTiny)
draw_text_ext_transformed(1088, 200 - 32, argument5, 24, 748, 1, 1, 0)
//draw_text_justified(argument4, 100, room_width - 32, 192, fntTiny, -1, -1, -1, -1)

draw_reset()
