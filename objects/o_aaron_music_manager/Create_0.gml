/// @description Initialize Music Player; Start Loop

// Use this to declare this object a music player entity. Sets important variables.
aaron_music_init(); 

// Use this to start a loop with an intro
//<Param1> Intro Sound (Set to 'noone' if no Intro)
//<Param2> Loop Sound
//<Param3> Start Delay of Loop Track (in Seconds) (Set to '0' if no Intro)
//<Param4> The position in the audio track (in seconds) where the loop should take place (includes intro time for Aaron's sake)
aaron_music_loop_start(a_pirate_theme_intro, a_pirate_theme_loop, 7.384, 56.923);

// Use this if you want to view debugger. Also make sure to put 
// aaron_music_debug_draw() in the Draw event;
aaron_music_debug_init();


