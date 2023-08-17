// Unarmed.
if scrIsUnarmed(argument0) return 85
if global.character = 1 return 85
if global.character = 2 return 85

// Player turn.
if argument0=sprPTurnShotgun return 1
if argument0=sprPTurnMP5 return 12
if argument0=sprPTurnAK return 26
if argument0=sprPTurnDesertEagle return 52
if argument0=sprPTurnHK417 return 0
if argument0=sprPTurnThompson return 41
if argument0=sprPTurnCrossbow return 43
if argument0=sprPTurnDoubleBarrel return 6
if argument0=sprPTurnPatriot return 64

// Player reload.
if argument0 = sprPReloadSniper return 29
if argument0 = sprPReloadWA2000 return 49
if argument0 = sprPReloadSuppressedMG return 32
if argument0 = sprPReloadSilencedShotgun return 30
if argument0 = sprPReloadKSG return 54
if argument0 = sprPReloadDoubleBarrel return 6
if argument0 = sprPReloadShotgun return 1
if argument0 = sprPCockShotgun return 1
if argument0 = sprPReloadHK417 return 0
if argument0 = sprPReloadScorpion return 11
if argument0 = sprPReloadMP5 return 12
if argument0 = sprPReloadFMG return 55
if argument0 = sprPReloadM16 return 14
if argument0 = sprPReloadUzi return 9
if argument0 = sprPReloadSilencer return 7
if argument0 = sprPReloadDesertEagle return 52
if argument0 = sprPReloadIngram return 25
if argument0 = sprPReloadPistol return 27
if argument0 = sprPReloadAK return 26
if argument0 = sprPReloadThompson return 41
if argument0 = sprPReloadDisruptor return 59

// JOHN
if argument0=sprPAttackHK417 or argument0=sprPWalkHK417 return 0
if argument0=sprPAttackShotgun or argument0=sprPWalkShotgun return 1
if argument0=sprPAttackPipe or argument0=sprPWalkPipe return 3 
if argument0=sprPAttackPatriot or argument0=sprPWalkPatriot return 64
if argument0=sprPAttackKSG or argument0=sprPWalkKSG return 54
if argument0=sprPAttackSilencedShotgun or argument0=sprPWalkSilencedShotgun return 30
if argument0=sprPAttackClub or argument0=sprPWalkClub return 2
if argument0=sprPAttackBat or argument0=sprPWalkBat return 4
if argument0=sprPAttackChain or argument0=sprPWalkChain return 34
if argument0=sprPAttackIthaca or argument0=sprPWalkIthaca return 71
if argument0=sprPAttackKnife or argument0=sprPAttackKnifeSlash1 or argument0=sprPAttackKnifeSlash2 or argument0=sprPAttackKnifeStab or argument0=sprPWalkKnife return 5
//if argument0=sprPAttackExtinguisher or argument0=sprPWalkExtinguisher return 83
//if argument0=sprPAttackStunBaon or argument0=sprPWalkStunBaton return 87
//if argument0=sprPAttackFish or argument0=sprPWalkFish return 88
//if argument0=sprPAttackPitchfork or argument0=sprPWalkPitchfork return 89
//if argument0=sprPAttackSign or argument0=sprPWalkSign return 90
//if argument0=sprPAttackShears or argument0=sprPWalkShears return 91
//if argument0=sprPAttackAcidSoaker or argument0=sprPWalkAcidSoaker return 92
if //argument0=sprPAttackScissors or 
argument0=sprPWalkScissors return 93
if argument0=sprPAttackDoubleBarrel or argument0=sprPWalkDoubleBarrel return 6
if argument0=sprPAttack1887 or argument0=sprPWalk1887 return 78
if argument0=sprPAttackSilencer or argument0=sprPWalkSilencer return 7
if argument0=sprPAttackHalberdV or argument0=sprPAttackHalberdH or argument0=sprPWalkHalberd return 79
if argument0=sprPAttackKatanaH1 or argument0=sprPAttackKatanaH2 or argument0=sprPAttackKatanaV or argument0=sprPWalkKatana return 8
if argument0=sprPAttackLeviathan or argument0=sprPWalkLeviathan return 80
if argument0=sprPAttackChainsaw or argument0=sprPWalkChainsaw return 31
if argument0=sprPAttackUzi or argument0=sprPWalkUzi return 9
if argument0=sprPAttackIngram or argument0=sprPWalkIngram return 25
if argument0=sprPAttackNailgun or argument0=sprPWalkNailGun return 33 
if argument0=sprPAttackSuppressedMG or argument0=sprPWalkSuppressedMG return 32
if argument0=sprPAttackSniper or argument0=sprPWalkSniper return 29
if argument0=sprPAttackMagnum or argument0=sprPWalkMagnum return 10
if argument0=sprPAttackScorpion or argument0=sprPWalkScorpion return 11
if argument0=sprPAttackMP5 or argument0=sprPWalkMP5 return 12
if argument0=sprPAttackPool or argument0=sprPWalkPool return 13
if argument0=sprPAttackM16 or argument0=sprPWalkM16 return 14
if argument0=sprPAttackAxe or argument0=sprPWalkAxe return 15
if argument0=sprPAttackNightStick or argument0=sprPWalkNightStick return 16
if argument0=sprPAttackTrophy or argument0=sprPWalkTrophy return 20
if argument0=sprPAttackDrill or argument0=sprPWalkDrill return 21
if argument0=sprPAttackPan or argument0=sprPWalkPan return 22
if argument0=sprPAttackBoilingPot or argument0=sprPWalkBoilingPot return 23
if argument0=sprPAttackPot or argument0=sprPWalkPot return 24
if argument0=sprPAttackMachete or argument0=sprPWalkMachete return 18
if argument0=sprPAttackLongSword1 or argument0=sprPAttackLongSword2 or argument0=sprPWalkLongSword return 81
if argument0=sprPAttackSledgeHammer or argument0=sprPWalkSledgeHammer return 19
if argument0=sprPAttackCrowbar or argument0=sprPWalkCrowbar return 17
if argument0=sprPAttackAK or argument0=sprPWalkAK return 26
if argument0=sprPAttackHandgun or argument0=sprPWalkHandgun return 27
if argument0=sprPAttackDesertEagle or argument0=sprPWalkDesertEagle return 52
if argument0=sprPAttackFMG or argument0=sprPWalkFMG return 55
if argument0=sprPAttackAJM or argument0=sprPWalkAJM return 57
if argument0=sprPAttackFlareGun or argument0=sprPWalkFlareGun return 36
if argument0=sprPAttackM79 or argument0=sprPWalkM79 return 60
if argument0=sprPAttackMGL or argument0=sprPWalkMGL return 61
if argument0=sprPAttackMauser or argument0=sprPWalkMauser return 62
if argument0=sprPAttackFlamethrower or argument0=sprPWalkFlamethrower return 28
if argument0=sprPAttackCleaver or argument0=sprPWalkCleaver return 35
if argument0=sprPAttackSkateboard or argument0=sprPWalkSkateboard return 37
if argument0=sprPAttackRealizer or argument0=sprPWalkRealizer return 38
if argument0=sprPAttackArm or argument0=sprPWalkArm return 39
if argument0=sprPAttackBust or argument0=sprPWalkBust return 40
if argument0=sprPAttackThompson or argument0=sprPWalkThompson return 41
if argument0=sprPAttackLMG or argument0=sprPWalkLMG return 42
if argument0=sprPAttackWA2000 or argument0=sprPWalkWA2000 return 49
if argument0=sprPAttackCrossbow or argument0=sprPWalkCrossbow return 43
if argument0=sprPAttackGuitar or argument0=sprPWalkGuitar return 44
if argument0=sprPAttackGarand or argument0=sprPWalkGarand return 45
if argument0=sprPAttackCircularSaw or argument0=sprPWalkCircularSaw return 53
if argument0=sprPAttackHysteria or argument0=sprPWalkHysteria return 72
if argument0=sprPAttackBigPipe or argument0=sprPWalkBigPipe return 75
if argument0=sprPAttackBong or argument0=sprPWalkBong return 65
//if argument0=sprPAttackScythe or 
if argument0=sprPWalkScythe return 46
if argument0=sprPAttackAutoShotgun or argument0=sprPWalkAutoShotgun return 47
//if argument0=sprPAttackHatchet or argument0=sprPWalkHachet return 56
if argument0=sprPWalkMauser or argument0=sprPWalkMauser return 62
if argument0=sprPAttackBow or argument0=sprPWalkBow return 73
if argument0=sprPAttackHammer or argument0=sprPWalkHammer return 50
if argument0=sprPAttackWrench or argument0=sprPWalkWrench return 51
if argument0=sprPAttackMultiplas or argument0=sprPWalkMultiplas return 58
if argument0=sprPAttackDisruptor or argument0=sprPWalkDisruptor return 59
if argument0=sprPAttackScrewdriver or argument0=sprPWalkScrewdriver return 84
//if argument0=sprPAttackSAA or argument0=sprPWalkSAA return 68
if argument0=sprPAttackSawedOff or argument0=sprPWalkSawedOff return 69
if argument0=sprPAttackBottle or argument0=sprPWalkBottle return 70
if argument0=sprPAttackIthaca or argument0=sprPWalkIthaca return 71
if argument0=sprPAttackBrick or argument0=sprPWalkBrick return 74
if argument0=sprPAttackFAMAE or argument0=sprPWalkFAMAE return 76
if argument0=sprPAttackBag or argument0=sprPWalkBag return 86
if argument0=sprPAttackFAL or argument0=sprPWalkFAL return 77
if argument0=sprPAttackRPG or argument0=sprPWalkRPG return 63
if argument0=sprPAttackMace1 or argument0=sprPAttackMace2 or argument0=sprPWalkMace return 82

// Simone.
if argument0=simoneShoot2
or argument0=simoneShoot1
or argument0=simoneWalk
or argument0=simoneFanHammer
or argument0=simoneCockRevolver
or argument0=simoneThrow
or argument0=simonePistolWhip
or argument0=simoneAttackShield
or argument0=simoneWalkShield
or argument0=simoneReload
or argument0=simoneDrawGun
or argument0=simoneHolsterGun
or argument0=simoneExecuteShield1
or argument0=simoneExecuteShield2
or argument0=simoneExecuteShieldSnap
return 63

// Player misc.
//if argument0=sprPCockSilencer return 7

// Enemy attack.
if argument0=sprEAttackHK417 return 0
if argument0=sprEAttackThompson return 41
if argument0=sprEAttackShotgun return 1
if argument0=sprEAttackPipe return 3 
if argument0=sprEAttackClub return 2
if argument0=sprEAttackBat return 4
if argument0=sprEAttackKnife  return 5
if argument0=sprEAttackDoubleBarrel1 return 6
if argument0=sprEAttackDoubleBarrel2 return 6
if argument0=sprEAttackUzi return 9
if argument0=sprEAttackChain return 34
if argument0=sprEAttackAK return 26
if argument0=sprEAttackHandgun return 27
if argument0=sprEAttackMachete return 18
if argument0=sprEDodgerAttack return 8
if argument0=sprEDodgerDodge return 8
if argument0=sprEFatGunAttack return 11

// Enemy idle.
if argument0=sprEDrinking return round(random(6))
//if argument0=sprEnemySit return 7
if argument0=sprEIdlePee or argument0=sprEIdlePeeStop return 5
if argument0=sprEStandGuard return 0
if argument0=sprEIdleKnife return 5
//if argument0=sprETauntPipe return 3
//if argument0=sprETauntChain return 34
if argument0=sprEIdleCellPhone return 7
if argument0=sprEIdleSmoke return 7
if argument0=sprEFiddle return choose(2,3,4,5)
if argument0=sprEIdleSmokeMelee return choose(2,3,4)
if argument0=sprEIdleEatCandy return choose(2,3,4,5)
if argument0=sprEIdleDrinkBeer return 1
if argument0=sprEIdleYawn return 1

// Enemy walk.
if argument0=sprEWalkHK417 return 0
if argument0=sprEWalkShotgun return 1
if argument0=sprEWalkPipe return 3 
if argument0=sprEWalkClub return 2
if argument0=sprEWalkChain return 34
if argument0=sprEWalkBat return 4
if argument0=sprEWalkMachete return 18
if argument0=sprEWalkKnife return 5
if argument0=sprEWalkDoubleBarrel return 6
if argument0=sprEWalkAK return 26
if argument0=sprEWalkSilencer return 7
if argument0=sprEWalkUzi return 9
if argument0=sprEWalkHandgun return 27
if argument0=sprEDodgerWalk return 8
if argument0=sprEWalkThompson return 41
if argument0=sprEFatGunWalk return 11
if argument0=sprEHidingReload or argument0=sprEHiding return 12

/* Specialists.
if argument0=sprSpecialistWalkAA12 return 47
if argument0=sprJuggernautAttackMP5 or argument0=sprJuggernautWalkMP5 return 12
*/

// Enemy search.
if argument0=sprESearchHK417 return 0
if argument0=sprESearchShotgun return 1
if argument0=sprESearchPipe return 3 
if argument0=sprESearchClub return 2
if argument0=sprESearchBat return 4
if argument0=sprESearchKnife return 5
if argument0=sprESearchDoubleBarrel return 6
if argument0=sprESearchAK return 26
if argument0=sprESearchSilencer return 7
if argument0=sprESearchHandgun return 27
if argument0=sprESearchChain return 34

//Enemy misc.
if argument0=sprEFatDieSniper return 11
if argument0=sprEFatDieSniper2 return 11
if argument0=sprEFatDie return 11
if argument0=sprEHiding or argument0=sprEHidingReload return 14
return -123
