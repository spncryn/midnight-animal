whitealpha = 0
cflash = make_color_rgb(irandom(255),irandom(255),irandom(255))
hudshake = (global.shake / 6) * random(2)
cylinder_rotation = 0

if instance_exists(mnCharacterSelect) nothing = 1
else {

    if scrMovingPlayerExists() {

        // Find the current weapon's total ammunition count.

        // Define current selected weapon.
        global.ammo = objPlayer.ammo
        global.maxammo = 6 
        cylinder = global.ammo

        hud_calculate()

        // Begin drawing the interface.

        // Draw combo.
        draw_set_font(fntCombo)
        if global.combo > 0 {

            // Draw splatter.
            //draw_sprite_ext(sprHUDSplatter, 0, 450 + combox * 1.4 + hudshake / 3, 240 + hudshake / 3, 0.25, 0.25, 0, global.citrinitas, 0.3)
            //draw_sprite_ext(sprHUDSplatter, 0, 450 + combox * 1.4 - hudshake / 3, 240 - hudshake / 3, 0.25, 0.25, 0, global.rubedo, 0.3)
            draw_sprite_ext(sprHUDSplatter, 0, 420 + combox, 240, 0.25, 0.25, 0, c_black, 1)

            // Draw style rank.
            draw_set_halign(fa_right)

            // Define colour based on style tier.
            if global.combo <= 10 draw_set_colour(merge_colour(global.albedo, cflash, hudflash / 10))
            if global.combo <= 20 and global.combo > 10 draw_set_colour(global.citrinitas)
            if global.combo <= 30 and global.combo > 20 draw_set_colour(c_orange)
            if global.combo <= 40 and global.combo > 30 draw_set_colour(global.rubedo)
            if global.combo <= 50 and global.combo > 40 draw_set_colour(global.citrinitas)

            // Draw style text. 
            if global.combo < 245 {     
                draw_text_transformed_colour(450 + combox + hudshake / 3, 224 + hudshake / 3, style[floor((global.combo + 1) / 5)], 0.15, 0.15, 0, global.citrinitas, global.citrinitas, global.citrinitas, global.citrinitas, 0.2)
                draw_text_transformed_colour(450 + combox - hudshake / 3, 224 - hudshake / 3, style[floor((global.combo + 1) / 5)], 0.15, 0.15, 0, global.rubedo, global.rubedo, global.rubedo, global.rubedo, 0.3)
                draw_text_transformed_colour(450 + combox, 224, style[floor((global.combo + 1) / 5)], 0.15, 0.15, 0, merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), 1)
            } else {
                draw_text_transformed_colour(450 + combox + hudshake / 3, 224 + hudshake / 3, style[49], 0.15, 0.15, 0, global.citrinitas, global.citrinitas, global.citrinitas, global.citrinitas, 0.2)
                draw_text_transformed_colour(450 + combox - hudshake / 3, 224 - hudshake / 3, style[49], 0.15, 0.15, 0, global.rubedo, global.rubedo, global.rubedo, global.rubedo, 0.3)
                draw_text_transformed_colour(450 + combox, 224, style[global.combo + 1], 0.15, 0.15, 0, merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), 1)
            }
           

            // Draw combo bar shadow.
            draw_sprite_ext(sprComboMeter, 0, 390 + combox + hudshake / 3, 232 + hudshake / 3, global.combotime / 240, 1, 0, global.citrinitas, 0.3)
            draw_sprite_ext(sprComboMeter, 0, 390 + combox - hudshake / 3, 232 - hudshake / 3, global.combotime / 240, 1, 0, global.rubedo, 0.3)
            draw_sprite_ext(sprComboMeter, 0, 390 + combox, 232, global.combotime / 240, 1, 0, merge_colour(global.albedo, cflash, hudflash / 10), 1)

            // Draw combo bar.
            draw_sprite_ext(sprComboBar, 0, 390 + combox + hudshake / 3, 232 + hudshake / 3, 1, 1, 0, global.citrinitas, 0.3)
            draw_sprite_ext(sprComboBar, 0, 390 + combox - hudshake / 3, 232 - hudshake / 3, 1, 1, 0, global.rubedo, 0.3)
            draw_sprite_ext(sprComboBar, 0, 390 + combox, 232, 1, 1, 0, merge_colour(global.albedo, cflash, hudflash / 10), 1)

            // Draw combo.

            // If combo is divisible by five...
            if global.combo mod 5 = 0 {

                // ...draw the combo red, at an angle of -6... 
                draw_text_transformed_colour(450 + combox, 200, string(global.combo) + 'x', 0.6, 0.6, -6, global.rubedo, global.rubedo, global.rubedo, global.rubedo, 1)
            } else {

                // ...otherwise, draw it white, at a neutral angle.
                draw_text_transformed_colour(450 + combox + hudshake / 3, 200 + hudshake / 3, string(global.combo) + 'x', 0.5, 0.5, 0, global.citrinitas, global.citrinitas, global.citrinitas, global.citrinitas, 0.3)
                draw_text_transformed_colour(450 + combox - hudshake / 3, 200 - hudshake / 3, string(global.combo) + 'x', 0.5, 0.5, 0, global.rubedo, global.rubedo, global.rubedo, global.rubedo, 0.3)
                draw_text_transformed_colour(450 + combox, 200, string(global.combo) + 'x', 0.5, 0.5, 0, merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), merge_colour(global.albedo, cflash, hudflash / 10), 1)

            }
        }

        // Draw weapon icon.
        
        // Draw splatter if armed.
        if !scrIsUnarmed(objPlayer.sprite_index) draw_sprite_ext(sprHUDSplatter, 0, 30 + gunx * 1.6, 250, 0.5, 0.5, 0, c_black, 1)
        
            // Draw cylinder.
            draw_sprite_ext(sprCylinderHUD, cylinder, 45 + gunx + hudshake, 210 + hudshake, 0.33, 0.33, 0, global.citrinitas, 0.3)
            draw_sprite_ext(sprCylinderHUD, cylinder, 45 + gunx - hudshake, 210 + hudshake, 0.33, 0.33, 0, global.rubedo, 0.3)
            draw_sprite_ext(sprCylinderHUD, cylinder, 45 + gunx - hudshake * choose(-1, 1), 210 - hudshake, 0.33, 0.33, cylinder_rotation, merge_colour(global.albedo, cflash, hudflash / 10), 1)
            if global.ammo = 0 rotate_towards(cylinder_rotation, 720, 8)
        
        draw_interact_text()
        
        // Draw score.
        if global.myscore > 0 {
            draw_set_halign(fa_right)

            draw_set_colour(merge_colour(global.albedo, cflash, hudflash / 10))
            draw_set_alpha(1)
            draw_text_transformed(view_wview[0] - 24 + scorex + lengthdir_x(0.5, dir - 180), 14 + lengthdir_x(0.5, dir - 180), string(global.drawscore) + " pts", 0.25, 0.25, 0)
            
            // Move score.      
            if scorex > 0 scorex -= 8
            }

            
        // Move weapon icon.
        if gunx < 0 gunx += 8

        // Move combo.
        if global.combo > 1 {
            if combox > 0 combox -= 8
        }
    }
}
