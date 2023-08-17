if !instance_exists(objPlayer) exit

// Shotguns.
if objPlayer.sprite_index = sprPWalk1887 or objPlayer.sprite_index = sprPAttack1887
or objPlayer.sprite_index = sprPWalkSawedOff or objPlayer.sprite_index = sprPAttackSawedOff
or objPlayer.sprite_index = sprPWalkIthaca or objPlayer.sprite_index = sprPAttackIthaca
or objPlayer.sprite_index = sprPAttackAutoShotgun or objPlayer.sprite_index = sprPWalkAutoShotgun
or objPlayer.sprite_index = sprPAttackKSG or objPlayer.sprite_index = sprPWalkKSG or objPlayer.sprite_index = sprPReloadKSG
or objPlayer.sprite_index = sprPAttackDoubleBarrel or objPlayer.sprite_index = sprPWalkDoubleBarrel or objPlayer.sprite_index = sprPTurnDoubleBarrel
or objPlayer.sprite_index = sprPAttackShotgun or objPlayer.sprite_index = sprPWalkShotgun or objPlayer.sprite_index = sprPReloadShotgun or objPlayer.sprite_index = sprPTurnShotgun
or objPlayer.sprite_index = sprPAttackSilencedShotgun or objPlayer.sprite_index = sprPWalkSilencedShotgun or objPlayer.sprite_index = sprPReloadSilencedShotgun
cursor = sprCursorShotgun

// Special weapons.
else if objPlayer.sprite_index = sprPAttackFlamethrower or objPlayer.sprite_index = sprPWalkFlamethrower
or objPlayer.sprite_index = sprPAttackFlareGun or objPlayer.sprite_index = sprPWalkFlareGun
or objPlayer.sprite_index = sprPAttackMGL or objPlayer.sprite_index = sprPWalkMGL
or objPlayer.sprite_index = sprPAttackM79 or objPlayer.sprite_index = sprPWalkM79
or objPlayer.sprite_index = sprPThrow or objPlayer.sprite_index = sprPWalkGrenade
or objPlayer.sprite_index = sprPAttackMolotov or objPlayer.sprite_index = sprPWalkMolotov
or objPlayer.sprite_index = sprPAttackMultiplas or objPlayer.sprite_index = sprPWalkMultiplas
or objPlayer.sprite_index = sprPAttackDisruptor or objPlayer.sprite_index = sprPWalkDisruptor
cursor = sprCursorProjectile

// Rifles.
else if objPlayer.sprite_index = sprPAttackAK or objPlayer.sprite_index = sprPWalkAK or objPlayer.sprite_index = sprPTurnAK
or objPlayer.sprite_index = sprPAttackBow or objPlayer.sprite_index = sprPWalkBow
or objPlayer.sprite_index = sprPAttackCrossbow or objPlayer.sprite_index = sprPWalkCrossbow or objPlayer.sprite_index = sprPTurnCrossbow
or objPlayer.sprite_index = sprPAttackFAL or objPlayer.sprite_index = sprPWalkFAL
or objPlayer.sprite_index = sprPAttackLMG or objPlayer.sprite_index = sprPWalkLMG
or objPlayer.sprite_index = sprPAttackM16 or objPlayer.sprite_index = sprPWalkM16
or objPlayer.sprite_index = sprPAttackGarand or objPlayer.sprite_index = sprPWalkGarand
or objPlayer.sprite_index = sprPAttackHK417 or objPlayer.sprite_index = sprPWalkHK417 or objPlayer.sprite_index = sprPTurnHK417
or objPlayer.sprite_index = sprPAttackPatriot or objPlayer.sprite_index = sprPWalkPatriot or objPlayer.sprite_index = sprPTurnPatriot
or objPlayer.sprite_index = sprPAttackSniper or objPlayer.sprite_index = sprPWalkSniper
or objPlayer.sprite_index = sprPAttackWA2000 or objPlayer.sprite_index = sprPWalkWA2000
or objPlayer.sprite_index = sprPAttackSuppressedMG or objPlayer.sprite_index = sprPWalkSuppressedMG
or objPlayer.sprite_index = sprPAttackThompson or objPlayer.sprite_index = sprPWalkThompson or objPlayer.sprite_index = sprPTurnThompson
cursor = sprCursorRifle

// Submachine guns.
else if objPlayer.sprite_index = sprPAttackFMG or objPlayer.sprite_index = sprPWalkFMG
or objPlayer.sprite_index = sprPAttackFAMAE or objPlayer.sprite_index = sprPWalkFAMAE
or objPlayer.sprite_index = sprPAttackNailgun or objPlayer.sprite_index = sprPWalkNailGun
or objPlayer.sprite_index = sprPAttackMP5 or objPlayer.sprite_index = sprPWalkMP5 or objPlayer.sprite_index = sprPTurnMP5
or objPlayer.sprite_index = sprPAttackUzi or objPlayer.sprite_index = sprPWalkUzi 
or objPlayer.sprite_index = sprPAttackP90 or objPlayer.sprite_index = sprPWalkP90
or objPlayer.sprite_index = sprPAttackScorpion or objPlayer.sprite_index = sprPWalkScorpion
or objPlayer.sprite_index = sprPAttackIngram or objPlayer.sprite_index = sprPWalkIngram
or global.character = 2 
cursor = sprCursorSMG

// Handguns.
else if objPlayer.sprite_index = sprPAttackAJM or objPlayer.sprite_index = sprPWalkAJM
or objPlayer.sprite_index = sprPAttackHandgun or objPlayer.sprite_index = sprPWalkHandgun
or objPlayer.sprite_index = sprPAttackDesertEagle or objPlayer.sprite_index = sprPWalkDesertEagle or objPlayer.sprite_index = sprPTurnDesertEagle
or objPlayer.sprite_index = sprPAttackRealizer or objPlayer.sprite_index = sprPWalkRealizer
or objPlayer.sprite_index = sprPAttackMagnum or objPlayer.sprite_index = sprPWalkMagnum //or objPlayer.sprite_index = sprPTurnMagnum
//or objPlayer.sprite_index = sprPAttackSAA or objPlayer.sprite_index = sprPWalkSAA
or objPlayer.sprite_index = sprPAttackMauser or objPlayer.sprite_index = sprPWalkMauser
or objPlayer.sprite_index = sprPAttackSilencer or objPlayer.sprite_index = sprPWalkSilencer
or global.character = 3
cursor = sprCursorPistol

else cursor = sprCursor

// Draw cursor.
recoil = global.shake * 1.5
if recoil > 0 recoil -= 1 

// Draw teleportation marker.
if objPlayer.teleport = true {
    draw_sprite_ext(sprTeleportSelector, 0, global.mousex, global.mousey, 1, 1, teleport_angle, c_white, 0.9)
    teleport_angle += 1
} else {
    if scrIsReloading(objPlayer.sprite_index) {
        draw_sprite_ext(sprCursorReloading, image_index, global.mousex, global.mousey, 0.4, 0.4, -view_angle[0], c_white, 1)
        image_index += 0.35
    } else {
        draw_sprite_ext(sprHitmarker, 0, global.mousex, global.mousey, 0.2, 0.2, 0, c_white, hitalpha)
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(cursor, image_index, global.mousex, global.mousey, (25 + recoil) / 100, (25 + recoil) / 100, -view_angle[0], c_white, cursoralpha)
        draw_set_blend_mode(bm_normal)
    }
}

if hitalpha > 0 hitalpha -= 0.1
