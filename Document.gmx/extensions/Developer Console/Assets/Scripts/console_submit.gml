/// console_submit(console)
var console=argument0;

if console[? "active"] {

    var list = console[? "history"];
    var sug = console[? "suggestions"];
    var i,sep,len,no,c;
    sep = console[? "sep"];
    len = string_length(sep)-1;
    var t;
    
    /* Paste */
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) {
    
        var clip = clipboard_get_text();
        clip = string_replace_all(clip,chr(10),"");
        clip = string_replace_all(clip,chr(13),"");
        clip = string_replace_all(clip,"#","");
        console[? "string"] = string_insert(clip,console[? "string"],console[? "string_pos"]);
        console[? "string_pos"] += string_length(clip);
        
    } else
    
    /* String input */
    if keyboard_check_pressed(vk_anykey) {
 
        /* Delete */
        if keyboard_check_pressed(vk_backspace) {
        
            if console[? "string_pos"] > 1 then console[? "string_pos"] -= 1;
            console[? "string"] = string_delete(console[? "string"],console[? "string_pos"],1);
            
        } else 
        
        /* Back one position */
        if keyboard_check_pressed(vk_left) {
        
            if console[? "string_pos"] > 1 then console[? "string_pos"] -= 1;
            
        } else 
        
        /* Forward one position */
        if keyboard_check_pressed(vk_right) {
        
            console[? "string_pos"] += 1;
            
        } else 
        
        /* Selected last entered command */
        if keyboard_check_pressed(vk_up) {
        
            if console[? "dir"] = 1 {
                console[? "dir"] = -1;
                console[? "select"] = 0;
            }
            var last = ds_list_find_value(console[? "history"],console[? "select"]);
            if !is_undefined(last) {
                console[? "string"] = last;
                console[? "string_pos"] = string_length(last)+1;
            }
            if console[? "select"] < ds_list_size(console[? "history"]) then
            console[? "select"] += 1 else console[? "select"] = 0;
            
        } else 
        
        /* Selected suggested command */
        if keyboard_check_pressed(vk_down) {
        
            if console[? "dir"] = -1 {
                console[? "dir"] = 1;
                console[? "select"] = 0;
            }
            var sug = ds_list_find_value(console[? "suggestions"],console[? "select"]);
            
            if !is_undefined(sug) {
                sug = string_delete(sug,string_pos(sep,sug),string_length(sug));
                console[? "string"] = sug;
                console[? "string_pos"] = string_length(sug)+1;
            }
            
            if console[? "select"] < ds_list_size(console[? "suggestions"]) then
            console[? "select"] += 1 else console[? "select"] = 0;
            
        } else 
        
        /* Insert character */
        if !keyboard_check_pressed(vk_enter) {
        
            console[? "string"] = string_insert(keyboard_lastchar,console[? "string"],console[? "string_pos"]);
            if keyboard_lastchar != "" then console[? "string_pos"] += 1;
            
        }
        
        /* Reset last character */
        keyboard_lastchar = "";
    }
    
    /* Suggestions */
    if keyboard_check_released(vk_anykey) {
        if ds_exists(console[? "text"],ds_type_list) {
        
            var cmd = console[? "string"];
            
            var txt = console[? "text"];
            
            if ds_exists(console[? "suggestions"],ds_type_list) {
                var sugs = console[? "suggestions"];
                ds_list_clear(sugs);
                if string_length(keyboard_string) > 0 {
                    for(t=0;t<ds_list_size(txt);t++) {
                    
                        var line = txt[| t];
                        if string_copy(line,1,string_length(cmd)) = cmd {
                            ds_list_add(sugs,line);
                        }
                    
                    }
                }
            }
        }
    }

    if keyboard_check_pressed(vk_enter) && console[? "string"] != "" {
    
        /* Get command string */
        var str = console[? "string"];
        
        /* Add to history */
        ds_list_insert(list,0,str);
        
        /* Split console string */
        no = string_count(sep,str);
        for(i=0; i<=no; i++) {
            c[i] = str;
            repeat (i)
                c[i] = string_delete(c[i],1,string_pos(sep,c[i])+len);
            c[i] = string_delete(c[i],string_pos(sep,c[i]),string_length(c[i]));
        }
        
        /* Store command */
        console[? "command"] = c[0];
        console[? "arguments"] = c;
        console[? "count"] = no;
        
        /* Clear keyboard string */
        keyboard_string = "";
        
        /* Close on submit */
        if console[? "close"] {
            console[? "active"] = false;
            console[? "select"] = 0;
            instance_activate_all();
        }
        
        /* Preset commands */
        if console[? "preset"] {
            switch(c[0]) {
                case "game_restart": game_restart(); break;
                case "game_end": game_end(); break;
                case "window_set_fullscreen": 
                    if no = 1 then
                    window_set_fullscreen(real(c[1])); 
                break;
                case "room_restart": room_restart(); break;
                case "room_speed": 
                    if no = 1 then room_speed = real(c[1]); 
                break;
                case "audio_stop_all": audio_stop_all(); break;
                case "instance_create": 
                    if object_exists(asset_get_index(c[1])) {
                        if no = 3 then
                        instance_create(c[2],c[3],asset_get_index(c[1]));
                        else 
                        instance_create(mouse_x,mouse_y,asset_get_index(c[1]));
                    }
                break;
                case "screenshot": 
                    if no = 1 then background_save(c[? "bg"], c[1]); 
                break;
            }
        }
        
        /* Clear String */
        console[? "string"] = "";
        console[? "string_pos"] = 1;
        
        show_debug_message("DEV CONSOLE - Ran command: "+c[0]);
        
        return true;
        
    }
}


