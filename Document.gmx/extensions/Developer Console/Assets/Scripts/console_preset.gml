/// console_preset(console)
var c=argument0;
s = c[? "sep"];

console_add(c,"game_restart");
console_add(c,"game_end");
console_add(c,"window_set_fullscreen"+s+"1/0");
console_add(c,"room_restart");
console_add(c,"room_speed"+s+"steps");
console_add(c,"audio_stop_all");
console_add(c,"instance_create"+s+"object_name"+s+"x"+s+"y (created at mouse if x & y not given)");
console_add(c,"screenshot"+s+"filename.png");

c[? "preset"] = true;


