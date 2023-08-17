global.distlist=ds_list_create()
with argument2 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
with argument3 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
ds_list_sort(global.distlist,true)
global.my_id=-1234

with argument2 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
with argument3 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
ds_list_destroy(global.distlist)
return global.my_id
