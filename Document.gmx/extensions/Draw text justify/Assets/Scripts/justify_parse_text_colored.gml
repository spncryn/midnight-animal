/// justify_parse_text_colored(text, font)

var text = argument0;
var font = argument1;

draw_set_font(font);

text = string_replace_all(argument0, chr($0d) + chr($0a), "#");
text = string_replace_all(text, chr($0d), "#");
text = string_replace_all(text, chr($0a), "#");

if string_char_at(text, string_length(text)) != "#" text += "#";

var res;
var n = 0;

//var types;
//types[TYPE_WORD] = "WORD";
//types[TYPE_TAG] = "TAG ";
while string_length(text) > 0
{
    var token = justify_get_token(text);
    var word = token[0];
    var len = token[1];
    var type = token[2];
//    print(types[type], ": ", quoted(word));
    text = string_delete(text, 1, len);
    
    if type == TYPE_WORD
    {
        res[n, TEXT_TYPE] = TYPE_WORD;
        res[n, TEXT_WORD] = word;
        res[n, TEXT_WORD_WIDTH] = string_width(word);
    }
    else
    {
        var op = string_pos("=", word);
        if op == 0
        {
            var tag_id = string_copy(word, 2, string_length(word) - 2);
            var tag_value = 0;
        }
        else
        {
            var tag_id = string_copy(word, 2, op - 2);
            var tag_value = string_delete(word, 1, op);
            tag_value = string_delete(tag_value, string_length(tag_value), 1);
        }
        
        switch tag_id
        {
            // New line
            case "n":
                var t = TAG_NEW_LINE;
                var v = 0;
                break;
                
            // Color
            case "c":
                var t = TAG_COLOR;
                var v = convert_hex_to_gm_color(tag_value);
                break;
            
            // Unknown
            default:
                var t = TAG_UNKNOWN;
                var v = word;
        }
        
        res[n, TEXT_TYPE] = TYPE_TAG;
        res[n, TEXT_TAG] = t;
        res[n, TEXT_TAG_VALUE] = v;
    }
    n++;
}

return res;

