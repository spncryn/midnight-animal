color=merge_color(merge_color(merge_color(c_aqua,c_teal,0.5+lengthdir_y(0.5,coldir*3)),merge_color(c_fuchsia,c_purple,0.5+lengthdir_y(0.5,coldir*4.7)),0.5+lengthdir_y(0.25,coldir*2)),c_black,0.5+lengthdir_x(0.5,coldir))
color2=merge_color(merge_color(merge_color(c_aqua,c_teal,0.5+lengthdir_x(0.5,coldir*3)),merge_color(c_fuchsia,c_purple,0.5+lengthdir_x(0.5,coldir*4.7)),0.5+lengthdir_x(0.25,coldir*2)),c_black,0.5-lengthdir_x(0.5,coldir))
draw_set_blend_mode(bm_add)
color=merge_color(color,c_black,0.75-random(0.05))
color2=merge_color(color2,c_black,0.75-random(0.05))
draw_rectangle_color(0,0,room_width,room_height,color,color2,color2,color,0)
draw_set_blend_mode(bm_normal)
coldir += 0.15
