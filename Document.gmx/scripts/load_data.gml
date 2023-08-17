global.kills = 0

if file_exists(working_directory + "\dat") {
    file = file_text_open_read(working_directory + "\dat")
    //file_text_readln(file)
    global.kills = real(file_text_read_string(file))
    file_text_close(file)
} else {
    file = file_text_open_write(working_directory + "\dat")
    //file_text_writeln(file)
    file_text_write_string(file, "0")
    file_text_close(file)
}
