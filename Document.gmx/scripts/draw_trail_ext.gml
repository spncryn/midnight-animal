///draw_trail_ext(Width,Color,Sprite,Slim,Alpha)
//Ex. draw_trail(32,c_white,-1,1,1)
var Width,Color,Sprite,Slim,Alpha,AlphaT,Texture,Dir,Dim,Length;
//Preparing variables
Width = argument0; //How wide will the trail be
Color = argument1; //Which color will be used to tint the trail
Sprite = argument2; //Which sprite's texture must be used for the trail. Must have "Used for 3D" marked. -1 for no sprite 
Slim = argument3; //Whether the trail will slim down at the end
Alpha = argument4; //The alpha to draw the trail with (0-1), optional
//Setting the texture
if (Sprite >= 0){
Texture = sprite_get_texture(Sprite,0);
Dim = sprite_get_width(Sprite)/sprite_get_width(Sprite)
}
else {
Texture = -1;
Dim = 1
}
texture_set_repeat(1);
//Drawing the primitive
draw_primitive_begin_texture(pr_trianglestrip,Texture);
AlphaT = 1;
Dir = 0;
Length = ds_grid_width(GridTrail)-1;
for(var i = 0; i < Length; i++){
  if (GridTrail[# i,0] != GridTrail[# i+1,0] || GridTrail[# i,1] != GridTrail[# i+1,1])
    Dir = point_direction(GridTrail[# i,0],GridTrail[# i,1],GridTrail[# i+1,0],GridTrail[# i+1,1]);
  var Len = Width / 2 - ((i + 1) / Length * Width / 2) * Slim;
  var XX = lengthdir_x(Len,Dir + 90);
  var YY = lengthdir_y(Len,Dir + 90);
  AlphaT = (Length - i) / (Length / 2) * Alpha;
  draw_vertex_texture_colour(GridTrail[# i,0] + XX,GridTrail[# i,1] + YY,GridTrail[# i,2] / Width/Dim,0,Color,AlphaT);
  draw_vertex_texture_colour(GridTrail[# i,0] - XX,GridTrail[# i,1] - YY,GridTrail[# i,2] / Width/Dim,1,Color,AlphaT);
}
draw_primitive_end();
