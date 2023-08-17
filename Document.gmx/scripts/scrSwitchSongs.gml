///scrSwitchSongs(NewTrack,FadeTimeSeconds)
// NewTrack refers to the new audio file to play on global.CurrentSong.
// FadeTimeSeconds is the length of the crossfade between tracks in seconds.

NewTrackName=audio_get_name(argument0);
if audio_get_name(global.CurrentSong)=NewTrackName exit;

// Store player-defined max volume for reset.
StoredVolume=global.mvol;

// Convert full seconds to ms.
FadeTime = argument1*1000;

// Store the existing track.
if audio_exists(global.CurrentSong) OldSong = global.CurrentSong;

// Switch between tracks.
audio_sound_gain(OldSong,0,FadeTime);
FinalTrack=audio_play_sound(argument0,0,1);
audio_sound_gain(FinalTrack,0,0);
audio_sound_gain(FinalTrack,StoredVolume,FadeTime);
global.CurrentSong=FinalTrack;
