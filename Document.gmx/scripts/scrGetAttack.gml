if argument0=sprEWalkClub return sprEAttackClub
if argument0=sprEWalkPipe return sprEAttackPipe
if argument0=sprEWalkChain return sprEAttackChain
if argument0=sprEWalkBat or sprite_index=sprEWalkBat return sprEAttackBat
if argument0=sprEWalkKnife or sprite_index=sprEWalkKnife return sprEAttackKnife

if argument0=sprEWalkMachete or sprite_index=sprEWalkMachete return sprEAttackMachete

if argument0=sprEWalkShotgun return sprEAttackShotgun
if argument0=sprEWalkHK417 return sprEAttackHK417
if argument0=sprEWalkAK return sprEAttackAK
if argument0=sprEWalkThompson return sprEAttackThompson
if argument0=sprEWalkSilencer return sprEAttackSilencer
if argument0=sprEWalkUzi return sprEAttackUzi
if argument0=sprEWalkDoubleBarrel {if ammo=2 return sprEAttackDoubleBarrel1 else return sprEAttackDoubleBarrel2}

if argument0=sprEFatWalk return sprEFatAttack
if argument0=sprEFatWalkLSD return sprEFatAttackLSD
if argument0=sprEDodgerWalk return sprEDodgerAttack
if argument0=sprEChainsawWalk return sprEChainsawAttack
return argument0
