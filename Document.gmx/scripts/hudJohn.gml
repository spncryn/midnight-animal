whitealpha = 0
cflash = make_color_rgb(irandom(255),irandom(255),irandom(255))
hudshake = (0 / 6) * random(2)

if instance_exists(mnCharacterSelect) nothing = 1
else {

    if scrMovingPlayerExists() {

        // Define current selected weapon.
        gunhud = scrCurrentWeaponExt(objPlayer.sprite_index)
        name = scrGetWeaponName(scrCurrentWeaponExt(objPlayer.sprite_index))
        scrGetAmmoPlayer(gunhud)

        hud_calculate()

        // Begin drawing the interface.

        // Draw combo.
        draw_set_font(fntCombo)
        if global.combo > 0 {

            // Draw splatter.
            //draw_sprite_ext(sprHUDSplatter, 0, 450 + combox * 1.4 + global.deathshake / 3, 240 + global.deathshake / 3, 0.25, 0.25, 0, global.citrinitas, 0.3)
            //draw_sprite_ext(sprHUDSplatter, 0, 450 + combox * 1.4 - global.deathshake / 3, 240 - global.deathshake / 3, 0.25, 0.25, 0, global.rubedo, 0.3)
            //draw_sprite_ext(sprHUDSplatter, 0, 420 + combox, 240, 0.25, 0.25, 0, c_black, 1)

            // Draw style rank.
            draw_set_halign(fa_right)

            // Draw style text. 
            draw_text_hud(450 + combox + ammox, 224, style[floor((global.combo + 1) / 5)], 0.15, 0.15, 0)

            // Draw combo bar shadow.
            draw_sprite_hud(sprComboMeter, 0, 390, 232, global.combotime / 240, 1, 0)
            
            // Draw combo bar.
            draw_sprite_hud(sprComboBar, 0, 390 + combox, 232, 1, 1, 0)

            // Draw combo.

            // If combo is divisible by five...
            if global.combo mod 5 = 0 {

                // ...draw the combo red, at an angle of -6.
                draw_text_transformed_colour(450 + combox, 200, string(global.combo) + 'x', 0.6, 0.6, -6, global.rubedo, global.rubedo, global.rubedo, global.rubedo, 1)
            } else draw_text_hud(450 + combox + ammox, 200, string(global.combo) + 'x', 0.5, 0.5, 0)
        }

        // Draw weapon icon.
        
        // Draw splatter if armed.
        //if !scrIsUnarmed(objPlayer.sprite_index) draw_sprite_ext(sprHUDSplatter, 0, 30 + gunx * 1.6, 250, 0.5, 0.5, 0, c_black, 1)
        
        // If the player has a gun and has either run out of ammo or is reloading, fade the weapon out...
        if (scrPlayerHasGun() and global.ammo = 0) or scrIsReloading(objPlayer.sprite_index)
        draw_sprite_ext(hudWeapons, gunhud, 30 + gunx, 210, 0.25, 0.25, 0, merge_colour(merge_colour(global.albedo, cflash, hudflash / 10), c_ltgray, 0.7), 0.25)

        // ...otherwise, draw it white, as normal.
        else {
            draw_sprite_ext(hudWeapons, gunhud, 30 + gunx + global.deathshake / 3, 210 + global.deathshake / 3, 0.25, 0.25, 0, global.citrinitas, 0.3)
            draw_sprite_ext(hudWeapons, gunhud, 30 + gunx - global.deathshake / 3, 210 - global.deathshake / 3, 0.25, 0.25, 0, global.rubedo, 0.3)
            if scrPlayerHasGun() {
                draw_sprite_ext(hudWeapons, gunhud, 30 + gunx, 210, 0.25, 0.25, 0, merge_colour(global.albedo, cflash, hudflash / 10), 0.25)
                draw_sprite_ext(hudWeapons, gunhud, 30 + gunx, 210, 0.25, 0.25, 0, merge_colour(global.albedo, cflash, hudflash / 10), (global.ammo / global.maxammo))
                //draw_sprite_part_ext(hudWeapons, gunhud, 0, 0, 221, 367 * (global.ammo / global.maxammo), 3 + gunx, 164, 0.25, 0.25, merge_colour(global.albedo, cflash, hudflash / 10), 1)
            } else draw_sprite_ext(hudWeapons, gunhud, 30 + gunx, 210, 0.25, 0.25, 0, merge_colour(global.albedo, cflash, hudflash / 10), 1)
        }

        // Draw weapon name.
        draw_set_halign(fa_left)
        draw_set_font(fntHUD)
        draw_text_hud(54 + ammox, 222, name, 0.15, 0.15, 0)

        // Draw ammo.
        draw_set_font(fntAmmo)
        if scrCurrentWeaponExt(objPlayer.sprite_index) = 64 draw_text_hud(54 + ammox, 205, "Inf.", 0.25, 0.25, 0) // The Patriot.
        else draw_text_hud(54 + ammox, 205, ammostring, 0.25, 0.25, 0)

        // Draw score.
        if global.myscore > 0 {
            draw_set_halign(fa_right)
            draw_text_hud(view_wview[0] - 24 + scorex, 14, string(global.drawscore) + " pts", 0.15, 0.15, 0)       
            draw_set_alpha(1)
     
            // Move score.      
            if scorex > 0 scorex -= 8
        }

        // Draw health.
        draw_sprite_hud(hudHealthBarInner, 0, 24 + gunx + 10, 14, objPlayer.hp / objPlayer.max_hp, 1, 0)
        draw_sprite_hud(hudHealthBar, 0, 24 + gunx, 14, 1, 1, 0)
        
        // Draw interaction prompt.
        draw_interact_text()
        
        // Move HUD elements.

        // Move ammo.
        if global.ammo > -1 {
            if ammox < 0 ammox += 8
        } else {
            if ammox > -160 ammox -= 8
        }

        // Move weapon icon.
        if gunx < 0 gunx += 8

        // Move combo.
        if global.combo > 1 {
            if combox > 0 combox -= 8
        }
    }
}
