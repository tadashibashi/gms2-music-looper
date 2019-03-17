// Stop all currently playing music
if (intro && audio_is_playing(intro)) {
	audio_stop_sound(intro);
}
if (loop && audio_is_playing(loop)) {
	audio_stop_sound(loop);
}

// Stop every sound that is fading
for (var i = 0; i < ds_list_size(fading_sound_list); i++) {
	audio_stop_sound(ds_list_find_value(fading_sound_list, i));	
}


// Unset all init variables
intro = undefined;
loop = undefined;
loop_track = undefined;
loop_has_started = undefined;
track_fade_out = undefined;

// Destroy the ds_list of all current fading sounds
ds_list_destroy(fading_sound_list);
