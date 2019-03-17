// Init all variables that will be used as a music player

// Contains the list of currently fading sounds
fading_sound_list = ds_list_create();

intro = noone;
loop = noone;
loop_has_started = false;
track_fade_out = false;