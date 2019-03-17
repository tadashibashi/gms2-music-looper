/// @argument0 fade_time_millisec
var fade_time = argument0;
track_fade_out = true;

if (loop) {
	audio_sound_gain(loop, 0, fade_time);
	ds_list_add(fading_sound_list, loop);
}
if (intro) {
	audio_sound_gain(intro, 0 ,fade_time);
	ds_list_add(fading_sound_list, intro);
}

loop = noone;
loop_track = noone;
intro = noone;
loop_has_started = false;


