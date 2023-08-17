/// convert_hex_to_gm_color(value)

/******************************************************************************
Examples:

convert_hex_to_gm_color("FF0000") -> 255
convert_hex_to_gm_color("0000FF") -> 16711680 ($FF0000)
******************************************************************************/

var hex = string_upper(argument0);
var res = 0;

for (var i=1; i<=string_length(hex); i++)
{
    var n = ord(string_char_at(hex, i));
    res = (res << 4) + (((n + 4) % 23 - 6) & 15);
}

var col = (res & $ff00) | ((res & $ff) << 16) | ((res & $ff0000) >> 16);

return col;

