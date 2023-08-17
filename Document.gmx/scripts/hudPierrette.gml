if !scrMovingPlayerExists() exit
whitealpha = 0
cflash = make_color_rgb(irandom(255),irandom(255),irandom(255))
hudshake = (global.shake / 6) * random(2)

// Define current selected weapon.
global.ammo = objPlayer.ammo
if pierretteIsShielded(objPlayer.sprite_index)
or objPlayer.sprite_index = pierretteWalkSMG
or objPlayer.sprite_index = pierretteAttackSMG
or objPlayer.sprite_index = pierretteReload
or objPlayer.sprite_index = pierretteReloadShield global.maxammo = 32
else global.maxammo = 2
        
// Draw shield effect.
draw_sprite_stretched_ext(sprDirtyFilter, 0, 0, 0, view_wview, view_hview, c_white, shield_alpha)

// Draw letterbox.
scrDrawLetterBox()

if shielded = true {
    letterbox = true
    if shield_alpha < 1 shield_alpha += 0.1 else shield_alpha = 1
} else {
    if shield_alpha > 0 shield_alpha -= 0.1 else shield_alpha = 0
    letterbox = false
}

if instance_exists(mnCharacterSelect) nothing = 1
else {

    if scrMovingPlayerExists() //and pierretteIsShielded(objPlayer.sprite_index) 
    {

        hud_calculate()

        // Begin drawing the interface.
        
        draw_set_font(fntPierretteHUD)
        draw_set_halign(fa_left)
        
        // Draw objectives.
        draw_set_colour(global.c_shock)
        draw_text_transformed(24 + gunx, 36, "/// POLICE ASSAULT IN PROGRESS ///", 0.125, 0.125, 0)
        draw_text_hud(24 + gunx, 54, "ACTIVE THREATS DETECTED: " + string(instance_number(objEnemy)), 0.1, 0.1, 0)
        
        // Draw health.
        draw_sprite_hud(hudHealthBar, 1, 14 + gunx, 192, 1, 1, 0)
        draw_sprite_hud(hudHealthBarInner, 1, 14 + gunx + 10, 192, objPlayer.hp / objPlayer.max_hp, 1, 0)
        draw_text_hud(92 + 32 + gunx, 192 + 4, string(floor(objPlayer.hp / objPlayer.max_hp * 100)), 0.125, 0.125, 0)

        // Draw combo.
            
        // Draw combo bar back.
        draw_sprite_hud(sprComboBar, 1, 24 + gunx, 192 + 18, 1.4, 0.75, 0)

        // Draw combo bar front.
        draw_sprite_hud(sprComboMeter, 0, 24 + gunx, 192 + 18, (global.combotime / 240) * 1.4, 0.75, 0)
        
        // Draw combo.
        //draw_set_colour(make_colour_rgb(65, 157, 193))
        draw_text_hud(92 + 32 + gunx, 192 + 18 + 2, string(global.combo) + "x", 0.125, 0.125, 0)
        
        // Draw ammo.
        draw_sprite_hud(hudPierretteSMG, objPlayer.ammo, view_wview[0] - 84, 200, 1, 1, 0)
        draw_sprite_hud(hudPierretteFlashbang, objPlayer.thrown, view_wview[0] - 108, 200 - 2, 1, 1, 0)
        
        // Draw interaction prompt.
        draw_interact_text()
        
        // MOVE HUD ELEMENTS

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
