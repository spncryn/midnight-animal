/// console_create()
var console = ds_map_create();

console[? "active"] = false;
console[? "sep"] = ",";
console[? "cursor"] = 0;
console[? "close"] = false;
console[? "history"] = ds_list_create();
console[? "select"] = 0;
console[? "preset"] = false;
console[? "dir"] = -1;
console[? "string"] = "";
console[? "string_pos"] = 1;
console[? "text"] = noone;
console[? "suggestions"] = noone;

return console;


