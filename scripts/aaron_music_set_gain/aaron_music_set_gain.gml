///@argument0 gainLevel
///@argument1 time_millisec
var _gainLevel = argument0;
var _time = argument1;


if (loop != noone) {
	audio_sound_gain(loop, _gainLevel, _time);	
}

if (intro != noone) {
	audio_sound_gain(intro, _gainLevel, _time);	
}