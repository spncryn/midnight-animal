//show_message(room_get_name(global.sequence))
file_delete(working_directory + "\dat")
file = file_text_open_write(working_directory + "\dat")
file_text_write_string(file, string(global.kills))
file_text_close(file)