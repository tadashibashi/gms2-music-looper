if (keyboard_check_pressed(ord("H")) ) {
	show_debug = !show_debug;	
}

if (!show_debug) exit;


var grid_size = 12;
var sprite = s_music_note;
var playing_list = ds_list_create();
if (audio_is_playing(intro)) {
	ds_list_add(playing_list, intro);	
}
if (audio_is_playing(loop)) {
	ds_list_add(playing_list, loop);	
}

var _width = grid_size*3/4*56;
var _height = max((ds_list_size(playing_list)+ 2) * grid_size, (ds_list_size(fading_sound_list) + 2) * grid_size); 

if (mouse_check_button_pressed(mb_left) && mouse_x > x - grid_size && mouse_x < x +_width && mouse_y > y - grid_size && mouse_y < y + _height) {
	clicked = true;	
}
if (mouse_check_button_released(mb_left) && clicked) {
	clicked = false;	
}

if (clicked) {
	x = mouse_x;
	y = mouse_y;	
	x = clamp(x, 0, room_width - _width);
	y = clamp(y, 0, room_height - _height);
}


draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(x, y, x+_width, y+_height, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_font(f_default);

draw_sprite_ext(sprite, 0, x,y,grid_size/sprite_width, grid_size/sprite_height,0,c_white,1); 
var _loop_text;
if (intro == noone) {
	_loop_text = string(0);
} else {
	_loop_text = string(loop_start_delay_seconds); 	
}

draw_text(x + grid_size*1.5, y, "Aaron Music Player  || Loop: " + _loop_text + " LastBar: " + string(loop_last_measure_seconds));
draw_text(x, y + grid_size*1, "Now Playing: ");
for (var i = 0; i < ds_list_size(playing_list); i ++) {
	var _x = x;
	var _y = y + grid_size*1;
	var _text;
	var _track = ds_list_find_value(playing_list, i);
	_text = audio_get_name(_track);
	_y += grid_size*(i+1);
	_text = string_delete(_text, 21 , 50);
	var _time_text = string_format(audio_sound_get_track_position(_track), 3,3)
	draw_text(_x,_y, _text + " " + _time_text);
}

ds_list_destroy(playing_list);


draw_text(x + grid_size*3/4*32 + grid_size*1, y + grid_size*1, "Fading: ");
for (var i = 0; i < ds_list_size(fading_sound_list); i++) {
	var _x = x + grid_size*3/4*32 + grid_size*1;
	var _y = y + grid_size*1;
	var _text;
		
	_text = audio_get_name(ds_list_find_value(fading_sound_list, i));		
	_y += grid_size*(i+1);
	_text = string_delete(_text, 21, 50);
	draw_text(_x,_y,_text);
			
}