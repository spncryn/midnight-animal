///wsound_add(sound, name, artist, duration[sec])
wsound_init();
ds_list_add(WSOUND.listsound, argument0);
ds_list_add(WSOUND.listsongname, argument1);
ds_list_add(WSOUND.listartist, argument2);
ds_list_add(WSOUND.listsongduration, argument3);
