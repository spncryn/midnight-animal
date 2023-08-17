/// draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, image_xskew, image_yskew)

sprite   = argument0 
index    = argument1
xx       = argument2
yy       = argument3 
xscale   = argument4 
yscale   = argument5
cosAngle = cos(degtorad(argument6)) 
sinAngle = sin(degtorad(argument6)) 
tint     = argument7
alpha    = argument8
hskew    = argument9
vskew    = argument10

// Calculate common operations
sprTex    = sprite_get_texture(sprite, index) 
sprWidth  = sprite_get_width(sprite) 
sprHeight = sprite_get_height(sprite) 
sprXOrig  = sprite_get_xoffset(sprite) 
sprYOrig  = sprite_get_yoffset(sprite)

var tempX, tempY, tempDir, tempDist;

// Begin drawing primitive
draw_primitive_begin_texture(pr_trianglestrip, sprTex)

// Top-left corner
tempX = (-sprXOrig + (sprYOrig / sprHeight) * hskew) * xscale
tempY = (-sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale
draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 0, tint, alpha)

// Top-right corner
tempX = (sprWidth + (sprYOrig / sprHeight) * hskew - sprXOrig) * xscale
tempY = (-sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale
draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 0, tint, alpha)

// Bottom-left corner
tempX = (-sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale
tempY = (sprHeight - sprYOrig + (sprXOrig / sprWidth) * -vskew) * yscale
draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 0, 1, tint, alpha)

// Bottom-right corner
tempX = (sprWidth - sprXOrig + (1 - sprYOrig / sprHeight) * -hskew) * xscale
tempY = (sprHeight - sprYOrig + (1 - sprXOrig / sprWidth) * vskew) * yscale
draw_vertex_texture_color(xx + tempX * cosAngle - tempY * sinAngle, yy + tempX * sinAngle + tempY * cosAngle, 1, 1, tint, alpha)

// Finish drawing primitive
draw_primitive_end()
