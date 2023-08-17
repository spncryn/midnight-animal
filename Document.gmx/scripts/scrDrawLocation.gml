if leveltitle = ""
nothing = 1
else {
    if levelshow > 0 levelshow -= 1
    else leveltitle = ""
    draw_set_font(fntDate)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    if levelshow > 180 draw_set_alpha((240 - levelshow) * (1 / 60))
    if levelshow < 60 draw_set_alpha(levelshow * (1 / 60))

    draw_set_color(c_white)
    draw_text_transformed(view_wview[0] / 2, view_hview[0] * 0.7, leveltitle, 0.2, 0.2, 1)
    draw_set_alpha(1)
}
