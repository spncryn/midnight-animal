///scrAngleDifference(CurrentAngle,LastAngle)
var dir;

dir=argument0-argument1
if dir>180 dir-=360
if dir<-180 dir+=360

return dir
