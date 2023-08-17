d3d_set_projection_ortho(0,0,view_wview[0],view_hview[0],0)

// Draw tint.
draw_set_alpha(0.8)
draw_rectangle_color(0,0,view_wview[0],view_hview[0],global.rubedo,global.rubedo,global.rubedo,global.rubedo,0)

// Draw letterbox.
draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(0, 0, x2, 32, 0)
draw_rectangle(0, view_hview[0], x2, view_hview[0]-32, 0)

// Draw wipe.
draw_sprite_ext(sprRestartTransition, frame, 0, 0, 1, 1, 0, c_black, 1)

// Draw menu image.
//draw_sprite_ext(sprDeathIcon, 0, xx, 26, 0.7, 0.7, 0, image_blend, 1)

if frame < 46 frame += 1 else frame = 46

// Set font properties.
draw_set_font(fntRestart)
draw_set_halign(fa_right)
draw_set_valign(fa_center)
draw_set_color(c_white)

// Draw quotes.
draw_text_transformed(view_wview[0] - 24, view_hview[0] / 2  - 5, quote[text], 0.15, 0.15, 0)

// Draw restart.
draw_text_transformed(view_wview[0] - 24, view_hview[0] / 2 + 24, "Press " + global.restartkey + " " + restart[i], 0.1, 0.1, 0)

draw_set_halign(fa_center)

if fade = 1 {
    color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount))
    /*if amount > 90 color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)))
    else */color2 = c_white
    draw_set_blend_mode(bm_subtract)
    draw_rectangle_color(-10, -10, view_wview[0] + 10, view_hview[0] + 10, color2, color1, color1, color2, 0)
    draw_set_blend_mode(bm_normal)
}

// Draw pulse.
//draw_sprite_ext(sprHeartbeatPulse, image_index, view_wview[0] / 2 + 80, view_hview[0] / 2  - 45, 0.5, 0.5, 0, c_white, 1)
