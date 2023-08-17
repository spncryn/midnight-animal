/// justify_check_tags(text, position)

var text = argument0;
var pos = argument1;

if text[pos, TEXT_TYPE] != TYPE_TAG
    return false;

var tag_id = text[pos, TEXT_TAG];
switch tag_id
{
    case TAG_COLOR:
        draw_set_colour(text[pos, TEXT_TAG_VALUE]);
        break;
    
    default:
        if debug_mode
            print("Incorrect tag: ", tag_id);
}

return true;

