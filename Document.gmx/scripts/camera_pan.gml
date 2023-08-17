viewspeed=point_distance(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,argument0,argument1)*0.05
viewdir=point_direction(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,argument0,argument1)

view_xview[0]+=lengthdir_x(viewspeed,viewdir)
view_yview[0]+=lengthdir_y(viewspeed,viewdir)

vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
view_angle[0]=lengthdir_y(vdist*(1/160),vdir*2)

camera_limit()
