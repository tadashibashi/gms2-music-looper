/// @argument0 intro_sound_index
/// @argument1 loop_sound_index
/// @argument2 loop_start_delay_seconds
/// @argument3 loop_last_measure_seconds
var intro_sound_index = argument0;
var loop_sound_index = argument1;

if (intro_sound_index != noone) {
	intro = audio_play_sound(intro_sound_index, 50, false);	
} else {
	intro = noone;	
}

loop_track = loop_sound_index;
loop_start_delay_seconds = argument2;
loop_last_measure_seconds = argument3 - loop_start_delay_seconds;



