///trail_calculate(length)
//Ex. calculate_trail(32)
var Length,Dir,Min,Width;
//Preparing variables
if !ds_exists(GridTrail,ds_type_grid) GridTrail = ds_grid_create(1,3);
Length = argument0; //How many previous coordinates will use the trail
Width = ds_grid_width(GridTrail);
//Replacing previous coordinates positions within the array
Min = min(Width,Length);
if (Min == Width) ds_grid_resize(GridTrail,Width+1,3);
for (var i = Min; i > 0; i--){
  GridTrail[# i,0] = GridTrail[# i - 1,0];
  GridTrail[# i,1] = GridTrail[# i - 1,1];
  GridTrail[# i,2] = GridTrail[# i - 1,2];
}
GridTrail[# 0,0] = x;
GridTrail[# 0,1] = y;
//Getting distance between current and past coordinates
if (Width > 1) GridTrail[# 0,2] = point_distance(GridTrail[# 0,0],GridTrail[# 0,1],GridTrail[# 1,0],GridTrail[# 1,1]) + GridTrail[# 1,2];
else GridTrail[# 0,2] = 0;
