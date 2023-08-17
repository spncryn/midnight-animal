// MELEE EXECUTIONS

//if global.combo <= 10 execution = choose(objPKillNeckSnap, objPKillPunch) else execution = choose(objPKillStomp, objPKillHeadRip)
execution = choose(objPKillNeckSnap, objPKillPunch, objPKillStomp)

if scrIsUnarmed(argument0) return execution

if argument0 = sprPWalkBat or argument0 = sprPAttackBat or argument0 = sprPWalkCrowbar
or argument0 = sprPAttackCrowbar or argument0 = sprPAttackPan or argument0 = sprPWalkPan
or argument0 = sprPAttackPot or argument0 = sprPWalkPot 
or argument0 = sprPWalkBag or argument0 = sprPAttackBag
or argument0 = sprPWalkArm or argument0 = sprPAttackArm or argument0 = sprPAttackBust
or argument0 = sprPWalkBust or argument0 = sprPWalkGuitar or argument0 = sprPAttackGuitar
return objPBluntKill

if argument0 = sprPWalkKnife or argument0 = sprPAttackKnife or argument0 = sprPAttackKnifeSlash1 or argument0=sprPAttackKnifeSlash2 or argument0 = sprPAttackKnifeStab return choose(objPKillKnife, objPKillKnifeStab)
if argument0 = sprPWalkKitchenKnife return objPKillKitchenKnife
if argument0 = sprPWalkMachete or argument0 = sprPAttackMachete return choose(objPKillMachete, objPKillMacheteSlash)
if argument0 = sprPWalkBoilingPot or argument0 = sprPAttackBoilingPot return objPBoilingPotKill
if argument0 = sprPWalkSledgeHammer or argument0 = sprPAttackSledgeHammer return objPSledgeKill
if argument0 = sprPWalkPipe or argument0 = sprPAttackPipe return choose(objPBluntKill, objPKillPipe)
if argument0 = sprPWalkClub or argument0 = sprPAttackClub return objPKillClub
if argument0 = sprPWalkSkateboard or argument0 = sprPAttackSkateboard return objPSkateboardKill
if argument0 = sprPWalkHammer or argument0 = sprPAttackHammer return objPKillHammer
if argument0 = sprPWalkBrick or argument0 = sprPAttackBrick return objPBrickKill
if argument0 = sprPWalkWrench or argument0 = sprPAttackWrench return objPKillWrench
if argument0 = sprPWalkBottle or argument0 = sprPAttackBottle return objPBottleKill
if argument0 = sprPWalkBottleBroken or argument0 = sprPAttackBottleBroken return objPBottleBrokenKill
if argument0 = sprPWalkAxe or argument0 = sprPAttackAxe return objPAxeKill
if argument0 = sprPWalkKatana or argument0=sprPAttackKatanaH1 or argument0=sprPAttackKatanaH2 or argument0=sprPAttackKatanaV or argument0=sprPAttackKatanaThrust return objPKillKatana
if argument0 = sprPWalkCleaver or argument0 = sprPAttackCleaver return objPKillCleaver
if argument0 = sprPWalkChainsaw or argument0 = sprPAttackChainsaw return choose(objPChainsawKill1, objPChainsawKill2)
if argument0 = sprPWalkPool or argument0 = sprPAttackPool return objPPoolKill
if argument0 = sprPWalkDrill or argument0 = sprPAttackDrill return objPDrillKill
if argument0 = sprPWalkFlamethrower or argument0 = sprPAttackFlamethrower return objPKillStomp
if argument0 = sprPWalkScrewdriver or argument0 = sprPWalkScrewdriver return objPScrewdriverKill

// UNARMED EXECUTIONS
//if global.character = 1 return objPKillNonlethal

// GUN EXECUTIONS
if objPlayer.ammo > 0 {
    if argument0 = sprPWalkHandgun or argument0 = sprPAttackHandgun return objPKill9mm
    if argument0 = sprPWalkDesertEagle or argument0 = sprPTurnDesertEagle or argument0 = sprPAttackDesertEagle return objPKillDesertEagle
    if argument0 = sprPWalkAJM or argument0 = sprPAttackAJM return objPKillAJM 
    if argument0 = sprPWalkNailGun or argument0 = sprPAttackNailgun return objPKillNailgun
    if argument0 = sprPWalkDW or argument0 = sprPReloadDW return objPKillBeretta 
    if argument0 = sprPWalkSilencer or argument0 = sprPAttackSilencer return objPKillSilencer
    if argument0 = sprPWalkMagnum or argument0 = sprPAttackMagnum return objPKillMagnum
    if argument0 = sprPWalkHK417 or argument0 = sprPAttackHK417 or argument0 =sprPTurnHK417 return objPKillHK417
    if argument0 = sprPWalkFAL or argument0 = sprPAttackFAL return objPKillFAL
    if argument0 = sprPWalkIngram or argument0 = sprPAttackIngram return objPKillIngram
    if argument0 = sprPWalkFAMAE or argument0 = sprPAttackFAMAE return objPKillFAMAE 
    if argument0 = sprPWalkShotgun or argument0 = sprPAttackShotgun or argument0 = sprPTurnShotgun return objPKillShotgun
    if argument0 = sprPWalkUzi or argument0 = sprPAttackUzi return objPKillUzi 
    if argument0 = sprPWalkAK or argument0 = sprPAttackAK or argument0 = sprPTurnAK return objPKillAK 
    if argument0 = sprPWalkThompson or argument0 = sprPAttackThompson or argument0 = sprPTurnThompson return objPKillThompson 
    if argument0 = sprPWalkP90 or argument0 = sprPAttackP90 return objPKillP90 
    if argument0 = sprPWalkMP5 or argument0 = sprPAttackMP5 or argument0 = sprPTurnMP5 return objPKillMP5 
}  else return execution

return execution
