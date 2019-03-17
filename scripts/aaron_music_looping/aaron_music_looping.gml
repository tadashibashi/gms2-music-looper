// Get the Intro's track time if it exists
var intro_time;
if (intro != noone) {
	intro_time = audio_sound_get_track_position(intro);
} else {
	intro_time = 0;	
}

// Start playing the loop once the delayed point has been reached , 
// or immediately if there is no intro
if ((intro_time >= loop_start_delay_seconds && !loop_has_started) || (intro == noone && !loop_has_started && loop_track) ) {
	loop = audio_play_sound(loop_track, 50, false);
	loop_has_started = true;
}

// Manages all fading sounds
// Stop every sound that has completely faded, and remove it from the fading sounds list
for (var i = 0; i < ds_list_size(fading_sound_list); i++) {
	var fading_sound_to_check = ds_list_find_value(fading_sound_list, i);
	if (audio_sound_get_gain(fading_sound_to_check) <= 0) {
		audio_stop_sound(fading_sound_to_check);
		ds_list_delete(fading_sound_list, i);
	}
}

// Exit this script at this point if the loop has not started, or exists
if (!loop_has_started || loop == noone) exit; //////////////////////////
// All looping functionality below this line ///////////////////////////


var loop_time = audio_sound_get_track_position(loop);

if ( loop_time >= loop_last_measure_seconds) {
	
	// Start playing the loop file when it has reached the loop point
	// The tail will stop playing automatically when it reaches the end of the file
	// so we no longer need the loop variable to track the index of the old loop
	loop = audio_play_sound(loop_track, 50, false);
}


