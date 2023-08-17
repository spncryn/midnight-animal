if view_xview[0] < 0 view_xview[0] = 0
if view_yview[0] < 4 view_yview[0] = 4
if view_xview[0] > room_width - view_wview[0] view_xview[0] = room_width - view_wview[0]
if view_yview[0] > room_height - view_hview[0] - 4 view_yview[0] = room_height - view_hview[0] - 4
if view_angle[0] > 1.25 view_angle[0] = 1.25
if view_angle[0] < -1.25 view_angle[0] = -1.25

if view_angle[0] > 0 view_angle[0] -= 0.05 else view_angle[0] = 0
