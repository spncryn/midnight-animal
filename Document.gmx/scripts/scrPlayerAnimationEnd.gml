image_speed = 0

// Guns.
if sprite_index = sprPAttackGarand sprite_index = sprPWalkGarand
if sprite_index = sprPAttackChargerCharged or sprite_index = sprPAttackChargerNormal sprite_index = sprPWalkCharger
if sprite_index = sprPAttackFMG sprite_index = sprPWalkFMG
if sprite_index = sprPAttackM16 sprite_index = sprPWalkM16
if sprite_index = sprPAttackRPG sprite_index = sprPWalkRPG
//if sprite_index = sprPAttackSAA sprite_index = sprPWalkSAA
if sprite_index = sprPAttackIthaca sprite_index = sprPWalkIthaca
if sprite_index = sprPAttackMultiplas sprite_index = sprPWalkMultiplas
if sprite_index = sprPAttackDisruptor sprite_index = sprPWalkDisruptor
if sprite_index = sprPAttackHK417 sprite_index = sprPWalkHK417
if sprite_index = sprPAttackAK sprite_index = sprPWalkAK
if sprite_index = sprPAttackHandgun sprite_index = sprPWalkHandgun
if sprite_index = sprPAttackDesertEagle sprite_index = sprPWalkDesertEagle
if sprite_index = sprPAttackKnifePistol sprite_index = sprPWalkKnifePistol
if sprite_index = sprPAttackAJM sprite_index = sprPWalkAJM
if sprite_index = sprPAttackLMG sprite_index = sprPWalkLMG
if sprite_index = sprPAttackMauser sprite_index = sprPWalkMauser
if sprite_index = sprPAttackWA2000 sprite_index = sprPWalkWA2000
if sprite_index = sprPAttackThompson sprite_index = sprPWalkThompson
if sprite_index = sprPAttackCrossbow sprite_index = sprPWalkCrossbow
if sprite_index = sprPAttackFlareGun sprite_index = sprPWalkFlareGun
if sprite_index = sprPAttackMGL sprite_index = sprPWalkMGL
if sprite_index = sprPAttackM79 sprite_index = sprPWalkM79
if sprite_index = sprPAttackFAL sprite_index = sprPWalkFAL
if sprite_index = sprPAttackDoubleBarrel sprite_index = sprPWalkDoubleBarrel
if sprite_index = sprPAttack1887 sprite_index = sprPWalk1887
if sprite_index = sprPAttackSawedOff sprite_index = sprPWalkSawedOff
if sprite_index = sprPAttackSilencer sprite_index = sprPWalkSilencer
if sprite_index = sprPAttackUzi sprite_index = sprPWalkUzi
if sprite_index = sprPAttackPatriot sprite_index = sprPWalkPatriot
if sprite_index = sprPAttackAutoShotgun sprite_index = sprPWalkAutoShotgun
if sprite_index = sprPAttackP90 sprite_index = sprPWalkP90
if sprite_index = sprPAttackSniper sprite_index = sprPWalkSniper
if sprite_index = sprPAttackIngram sprite_index = sprPWalkIngram
if sprite_index = sprPAttackNailgun sprite_index = sprPWalkNailGun
if sprite_index = sprPAttackBow sprite_index = sprPWalkBow
if sprite_index = sprPAttackSuppressedMG sprite_index = sprPWalkSuppressedMG
if sprite_index = sprPAttackSilencedShotgun sprite_index = sprPWalkSilencedShotgun
if sprite_index = sprPAttackMagnum sprite_index = sprPWalkMagnum
if sprite_index = sprPAttackKSG sprite_index = sprPWalkKSG
if sprite_index = sprPAttackRealizer sprite_index = sprPWalkRealizer
if sprite_index = sprPAttackScorpion sprite_index = sprPWalkScorpion
if sprite_index = sprPAttackMP5 sprite_index = sprPWalkMP5
if sprite_index = sprPAttackFAMAE sprite_index = sprPWalkFAMAE
if sprite_index = sprPAttackFlamethrower sprite_index = sprPWalkFlamethrower
if sprite_index = sprPAttackShotgun {
    sprite_index = sprPWalkShotgun
    sound_ps(sndCockShotgun)
}

// Melee.
if sprite_index = sprPAttackHammer sprite_index = sprPWalkHammer
if sprite_index = sprPAttackBrick sprite_index = sprPWalkBrick
if sprite_index = sprPAttackWrench sprite_index = sprPWalkWrench
if sprite_index = sprPAttackScrewdriver sprite_index = sprPWalkScrewdriver
if sprite_index = sprPAttackBottle sprite_index = sprPWalkBottle
if sprite_index = sprPAttackBottleBroken sprite_index = sprPWalkBottleBroken
if sprite_index = sprPAttackKitchenKnife sprite_index = sprPWalkKitchenKnife
if sprite_index = sprPAttackTaser sprite_index = sprPWalkTaser
if sprite_index = sprPAttackKatanaH1 sprite_index = sprPWalkKatana
if sprite_index = sprPAttackKatanaH2 sprite_index = sprPWalkKatana
if sprite_index = sprPAttackKatanaV sprite_index = sprPWalkKatana
if sprite_index = sprPAttackKatanaThrust sprite_index = sprPWalkKatana
if sprite_index = sprPAttackMachete sprite_index = sprPWalkMachete
if sprite_index = sprPAttackBag sprite_index = sprPWalkBag
if sprite_index = sprPAttackDrill sprite_index = sprPWalkDrill
if sprite_index = sprPAttackLongSword1 sprite_index = sprPWalkLongSword
if sprite_index = sprPAttackPipe sprite_index = sprPWalkPipe

// Breakables.
if sprite_index = sprPAttackBottle sprite_index = sprPWalkBottle
if sprite_index = sprPAttackBust sprite_index = sprPWalkBust
if sprite_index = sprPAttackBong sprite_index = sprPWalkBong
//if sprite_index = sprPAttackScissors sprite_index = sprPWalkUnarmed

// Switch,
if sprite_index = sprPAttackLeviathan {
    sprite_index = sprPWalkLeviathan left = -left
}
if sprite_index = sprPAttackHysteria {
    sprite_index = sprPWalkHysteria left = -left
}
if sprite_index = sprPAttackMace1 or sprite_index = sprPAttackMace2 sprite_index = sprPWalkMace 
/*if sprite_index = sprPAttackScythe {
    sprite_index = sprPWalkScythe left = -left
}
if sprite_index = sprPAttackFish {
    sprite_index = sprPWalkFish left = -left
}
if sprite_index = sprPAttackHatchet {
    sprite_index = sprPWalkHatchet left = -left
}
if sprite_index = sprPAttackBattleAxe {
    sprite_index = sprPWalkBattleAxe left = -left
}
if sprite_index = sprPAttackExtinguisher {
    sprite_index = sprPWalkExtinguisher left = -left
}
if sprite_index = sprPAttackPitchfork {
    sprite_index = sprPWalkPitchfork left = -left
}
if sprite_index = sprPAttackStunBaton {
    sprite_index = sprPWalkStunBaton left = -left
}

if sprite_index = sprPAttackShears sprite_index = sprPWalkShears 
if sprite_index = sprPAttack sprite_index = sprPAttackScissors*/

if sprite_index = sprPAttackBigPipe {
    sprite_index = sprPWalkBigPipe left = -left
}
if sprite_index = sprPAttackCircularSaw {
    sprite_index = sprPWalkCircularSaw left = -left
}
if sprite_index = sprPAttackHysteria {
    sprite_index = sprPWalkHysteria left = -left
}
if sprite_index = sprPAttackHalberdV or sprite_index = sprPAttackHalberdH {
    sprite_index = sprPWalkHalberd left = -left
}
if sprite_index = sprPAttackCrowbar {
    sprite_index = sprPWalkCrowbar left = -left
}
if sprite_index = sprPAttackGuitar {
    sprite_index = sprPWalkGuitar left = -left
}
if sprite_index = sprPAttackPan {
    sprite_index = sprPWalkPan left = -left
}
if sprite_index = sprPAttackPool {
    sprite_index = sprPWalkPool left = -left
}
if sprite_index = sprPAttackAxe {
    sprite_index = sprPWalkAxe left = -left
}
if sprite_index = sprPAttackSledgeHammer {
    sprite_index = sprPWalkSledgeHammer left = -left
}
if sprite_index = sprPAttackPot {
    sprite_index = sprPWalkPot left = -left
}
if sprite_index = sprPAttackBoilingPot {
    sprite_index = sprPWalkPot left = -left
}
if sprite_index = sprPAttackLongSword2 {
    sprite_index = sprPWalkLongSword left = -left
}
if sprite_index = sprPAttackKnife or sprite_index = sprPAttackKnifeSlash1 or sprite_index = sprPAttackKnifeSlash2 or sprite_index = sprPAttackKnifeStab {
    sprite_index = sprPWalkKnife
}
if sprite_index = sprPAttackChainsaw {
    sprite_index = sprPWalkChainsaw left = -left
}
if sprite_index = sprPAttackCleaver {
    sprite_index = sprPWalkCleaver
}
if sprite_index = sprPAttackBat {
    sprite_index = sprPWalkBat left = -left
}
if sprite_index = sprPAttackArm {
    sprite_index = sprPWalkArm left = -left
}

if sprite_index = sprPAttackChain {
    sprite_index = sprPWalkChain left = -left
}
if sprite_index = sprPAttackClub {
    sprite_index = sprPWalkClub left = -left
}
if sprite_index = sprPAttackPunch or sprite_index = sprPAttackUnarmed1 or sprite_index = sprPAttackUnarmed2 {
    sprite_index = sprPWalkUnarmed
    left = -left
}

if sprite_index = sprPAttackTrophy {
    sprite_index = sprPWalkTrophy left = -left
}
if sprite_index = sprPAttackNightStick {
    sprite_index = sprPWalkNightStick left = -left
}
if sprite_index = sprPAttackSkateboard {
    sprite_index = sprPWalkSkateboard left = -left
}

// THOMAS: Disarm guns.
if sprite_index = sprThomasDisarmShotgun sprite_index = thomasWalk
if sprite_index = sprThomasDisarmDoubleBarrel sprite_index = thomasWalk
if sprite_index = sprThomasDisarmHK417 sprite_index = thomasWalk
if sprite_index = sprThomasDisarmHandgun sprite_index = thomasWalk
if sprite_index = sprThomasDisarmSilencer sprite_index = thomasWalk
if sprite_index = sprThomasDisarmThompson sprite_index = thomasWalk
if sprite_index = sprThomasDisarmKalashnikov sprite_index = thomasWalk

if sprite_index = thomasStrikeL1
or sprite_index = thomasStrikeL2
or sprite_index = thomasStrikeL3
or sprite_index = thomasStrikeL4
or sprite_index = thomasStrikeR1
or sprite_index = thomasStrikeR2
or sprite_index = thomasStrikeR3
or sprite_index = thomasStrikeR4
sprite_index = thomasWalk

// SIMONE.
if sprite_index = simoneShoot1 sprite_index = simoneWalk
if sprite_index = simoneShoot2 sprite_index = simoneWalk
if sprite_index = simoneFanHammer { sprite_index = simoneAim; image_speed = 0; image_index = sprite_get_number(sprite_index - 1) }
if sprite_index = simoneAim { image_index = 5 }
if sprite_index = simoneReload sprite_index = simoneCockRevolver
if sprite_index = simoneDrawGun sprite_index = simoneWalk
if sprite_index = simonePistolWhip sprite_index = simoneWalk
if sprite_index = simoneThrow sprite_index = simoneWalk
if sprite_index = simoneCockRevolver sprite_index = simoneWalk
if sprite_index = simoneAttackShield sprite_index = simoneWalkShield

// PIERRETTE
if sprite_index = pierretteBashShield sprite_index = pierretteWalkShield
if sprite_index = pierretteAttackShield sprite_index = pierretteAimShield
if sprite_index = pierretteDeployShield sprite_index = pierretteWalkShield
if sprite_index = pierretteThrowShield sprite_index = pierretteWalkShield

if sprite_index = pierretteAttackSMG sprite_index = pierretteWalkSMG
if sprite_index = pierretteAttackShotgun sprite_index = pierretteWalkShotgun
if sprite_index = pierrettePackUp sprite_index = pierretteWalkUnarmed
if sprite_index = pierretteReadyUp { sprite_index = pierretteWalkSMG; ammo = 32; instance_create(x, y, maskShield) } 
if sprite_index = pierretteDeployShield { sprite_index = pierretteWalkShield; objEffector.shielded = true }

if sprite_index = pierrettePlantShield {
    sprite_index = pierretteWalkSMG
    shield = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objPierretteShield)
    shield.image_angle = dir
    shield.direction = dir
    if instance_exists(maskShield) with maskShield instance_destroy()
}

// Miscellaneous.
if scrIsThrowing(sprite_index) sprite_index = global.current
if sprite_index = sprPCockShotgun sprite_index = sprPWalkShotgun
if sprite_index = sprPDetonateC4 sprite_index = sprPWalkC4
if sprite_index = sprPPlaceC4 {
    sprite_index = sprPWalkC4
    my_id = instance_create(x + lengthdir_x(14, dir + 35), y + lengthdir_y(12, dir + 35), objC4)
    my_id.speed = 1.25
    my_id.friction = 0.15
    my_id.direction = dir - 2 + random(4)
}

if sprite_index = sprPAttackMolotov sprite_index = sprPWalkUnarmed

// Idle states.
if sprite_index = sprJohnSmokeCigarette {
    sprite_index = sprPWalkUnarmed
}

if sprite_index = sprPDrinkSoda {
    sprite_index = global.current
    
    can = instance_create(x, y, objSodaCan)
    can.speed = 2 + random(2)
    can.friction = 0.2
    can.direction = dir - 8 + random(16)
    can.image_angle = can.direction
    can.empty = true
    sound_ps(choose(sndCanDrop1, sndCanDrop2, sndCanDrop3, sndCanDrop4))
}

if sprite_index = sprJohnPutAwayPhone {
    sprite_index = sprPWalkUnarmed
}
