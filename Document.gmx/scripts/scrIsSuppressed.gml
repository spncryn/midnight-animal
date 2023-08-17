if argument0 = sprPWalkSuppressedMG return true
if argument0 = sprPAttackSuppressedMG return true

if argument0 = sprPWalkIngram return true
if argument0 = sprPAttackIngram return true

if argument0 = sprPWalkFAMAE return true
if argument0 = sprPAttackFAMAE return true

if argument0 = sprPWalkSilencer return true
if argument0 = sprPAttackSilencer return true

if argument0 = sprPWalkFMG return true
if argument0 = sprPAttackFMG return true

if argument0 = sprPWalkWA2000 return true
if argument0 = sprPAttackWA2000 return true

if argument0 = sprPWalkSilencedShotgun return true
if argument0 = sprPAttackSilencedShotgun return true

if argument0 = sprPAttackAJM return true
if argument0 = sprPWalkAJM return true

if argument0 = sprPAttackM79 return true
if argument0 = sprPWalkM79 return true

if argument0 = sprPAttackMGL return true
if argument0 = sprPWalkMGL return true

if pierretteHasShield(argument0)
or argument0 = pierretteReloadShield
or argument0 = pierretteAimShield
or argument0 = pierretteAttackShield
or argument0 = pierretteWalkSMG
or argument0 = pierretteAttackSMG
return true

return false
