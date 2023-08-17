if(WSOUND.isPaused) {
    wsound_resume();
    exit;
}

with(WSOUND) {
    if(!index == 0) index++;
    if(index > ds_list_size(listsound) - 1) index = 0;
    currentsound = ds_list_find_value(listsound, index);
    currentname = ds_list_find_value(listsongname, index);
    currentartist = ds_list_find_value(listartist, index);
    d = ds_list_find_value(listsongduration, index);
    audio_play_sound_on(emitter, currentsound, true, 0);
    show = true;
    alarm[1] = showduration * room_speed;
    alarm[0] = d * room_speed;
}
