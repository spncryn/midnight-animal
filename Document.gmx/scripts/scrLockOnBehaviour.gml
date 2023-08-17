// Control lock-on.
if instance_exists(global.enemy) {

    // Lock the reticle to the target.
    global.mousex = global.enemy.x
    global.mousey = global.enemy.y

    if global.mousex = global.enemy.x and global.mousey = global.enemy.y {

        // Trail the reticle if it leaves the current view.
        myx = global.mousex
        myy = global.mousey
        if myx > view_xview[0] + view_wview[0] - 4 myx = view_xview[0] + view_wview[0] - 4
        if myy > view_yview[0] + view_hview[0] - 32 myy = view_yview[0] + view_hview[0] - 4
        if myx < view_xview[0] + 4 myx = view_xview[0] + 4
        if myy < view_yview[0] + 4 myy = view_yview[0] + 4

        // Draw lock-on.
        draw_sprite_ext(sprAim, 1, myx, myy, 1, 1, -view_angle[0], c_red, 1)

        // Draw cursor.

        draw_set_blend_mode(bm_add)
        draw_sprite_ext(cursor, image_index, (display_mouse_get_x() - width * 0.5) * (view_wview[0] / width), (display_mouse_get_y() - height * 0.5) * (view_hview[0] / height), (25 + recoil) / 100, (25 + recoil) / 100, -view_angle[0], c_white, cursoralpha)
        draw_set_blend_mode(bm_normal)
    }
} else {

    // Reset reticle position.
    global.enemy = -1234

    // Re-enable standard reticle when not locked on.
    cursoralpha = 0.5
}
