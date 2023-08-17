if scratch > 0 {
    draw_set_blend_mode(bm_add)
    repeat(scratch) {
        draw_sprite_ext(sprSmallWhiteDistortion, random(4), random(view_wview[0]), random(view_hview[0]), 1, 1, 0, merge_color(c_black, c_gray, random(1)), 1)
    }
    repeat(30) {
        draw_sprite_ext(sprMediumWhiteDistortion, random(4), random(view_wview[0]), view_hview[0] + 20 - random(6) - abs(scratch) * 0.5, 1 + random(2), 1, 0, merge_color(c_black, c_gray, random(1)), 1)
    }
    repeat(30) {
        draw_sprite_ext(sprMediumWhiteDistortion, random(4), random(view_wview[0]), view_hview[0] + 40 - random(6) - abs(scratch) * 0.6, 1 + random(2), 1, 0, merge_color(c_black, c_gray, random(1)), 1)
    }
    draw_set_blend_mode(bm_normal)
    scratch -= 2
}
