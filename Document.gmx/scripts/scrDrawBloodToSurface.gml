if done = 1 {
    draw_sprite_ext(sprite_index, image_index, x * 2 - 2 + random(4), y * 2 - 2 + random(4), image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha)
    instance_destroy()
}
