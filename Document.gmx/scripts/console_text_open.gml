/// console_text_open(console,text file)
var c=argument0;

var list;
if !ds_exists(c[? "text"],ds_type_list) {
    list = ds_list_create();
} else list = c[? "text"];

var file = file_text_open_read(argument1);

while (!file_text_eof(file)) {
    ds_list_add(list,file_text_readln(file));
}
file_text_close(file);

c[? "text"] = list;
if !ds_exists(c[? "suggestions"],ds_type_list) {
    c[? "suggestions"] = ds_list_create();
}



