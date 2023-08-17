/// play_song(NewTrack)
// Instantly begin playing a new track.
// NewTrack refers to the new audio file to play on global.CurrentSong.
/*
NewTrackName=audio_get_name(argument0);
if audio_get_name(global.CurrentSong)=NewTrackName exit;
audio_stop_sound(global.CurrentSong);

global.CurrentSong = audio_play_sound(argument0,1,1);
audio_sound_gain(global.CurrentSong,global.mvol,0);
