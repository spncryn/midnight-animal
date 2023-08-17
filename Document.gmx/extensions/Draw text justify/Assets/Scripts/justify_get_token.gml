/// justify_get_token(text)

var text = argument0;

var char = string_char_at(text, 1);

var sp = 0;
var pre = "";

// New line
//if char == "#" return array_create_ext("[n]", 1, TYPE_TAG);
if char == "#" return array_create_ext("#", 1, TYPE_WORD);

// Double open brace [[
while string_length(text) > 1 and string_char_at(text, 1) == "[" and string_char_at(text, 2) == "["
{
    pre += "[";
    sp += 1;
    text = string_delete(text, 1, 2);
}

// Tag
var char = string_char_at(text, 1);
if char == "[" and string_length(text) > 1 and string_char_at(text, 2) != "["
{
    var pos_brace = string_pos("]", text);
    if pos_brace > 0
    {
        var token = pre + string_copy(text, 1, pos_brace);
        if string_char_at(text, pos_brace + 1) == " " sp = 1;
        
        return array_create_ext(token, string_length(token) + sp, TYPE_TAG);
    }
}

// Word
var pos_nline = string_pos("#", text);
var pos_space = string_pos(" ", text);
var pos_brace = string_pos("[", text);

if max(pos_nline, pos_space, pos_brace) == 0
{
    return array_create_ext(pre + text, string_length(pre + text) + sp, TYPE_WORD);
}

if pos_nline == 0 pos_nline = max(pos_space, pos_brace) + 1;
if pos_space == 0 pos_space = max(pos_nline, pos_brace) + 1;
if pos_brace == 0 pos_brace = max(pos_space, pos_brace) + 1;

// Space char
if pos_space == min(pos_nline, pos_space, pos_brace)
{
    var token = string_copy(text, 1, pos_space - 1);
    sp += 1;
    return array_create_ext(pre + token, string_length(pre + token) + sp, TYPE_WORD);
}
// New line char
else if pos_nline == min(pos_nline, pos_space, pos_brace)
{
    var token = string_copy(text, 1, pos_nline - 1);
    return array_create_ext(pre + token, string_length(pre + token) + sp, TYPE_WORD);
}
// Brace [
else
{
    var token = string_copy(text, 1, pos_brace - 1);
    if string_char_at(text, pos_brace + 1) == " " sp += 1;
    return array_create_ext(pre + token, string_length(pre + token) + sp, TYPE_WORD);
}

