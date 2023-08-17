/// justify_draw_text(text, left, right, top, font, [first_line_indent, space_width, space_height, [space_paragraph]])
// use -1 in [first_line_indent, space_width, space_height] for default values
// example:
// justify_draw_text(text, 100, room_width - 100, 0, myfont, 80, 8, -1]
// justify_draw_text(text, 100, room_width - 100, 0, myfont, -1, 8, -1]
//
// Returns: height in pixels

if argument_count != 5 and argument_count != 8 and argument_count != 9
{
    draw_text(argument[1], argument[3], "[justify_draw_text] Error (Wrong number of arguments)");
    exit; // Invalid arguments
}

/*********************************************
**                Prepare                   **
*********************************************/
draw_set_font(argument[4]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var text = argument[0];
var posx_min = argument[1];
var posx_max = argument[2];
var posy = argument[3];
var posy_start = posy;

var paragraph_size = 50;                // First line indent
var hspace = 4;                         // Horizontal space between words
var vspace = string_height("1j") + 5;   // Space between lines
var pspace = 4;     // Space between paragraphs

if argument_count > 5
{
    if argument[5] >= 0
        paragraph_size = argument[5];
    if argument[6] >= 0
        hspace = argument[6];
    if argument[7] >= 0
        vspace = argument[7];
    if argument_count > 8 and argument[8] >= 0
        pspace = argument[8];
}

var sz = array_height_2d(text);

/*********************************************
**                Draw text                 **
*********************************************/
var maximum_width = posx_max - posx_min;

var paragraph = paragraph_size;

var ww = 0;             // Assembled words width
var sw = paragraph;     // Assembled spaces width
var cnt = 0;            // Assembled words counter
var pos = 0;            // Position of the first word of the current line in array
var cx;

for (var i=0; i<sz-1; i++)
{
    // Assemble line and calculate the amount of indentation
    var word = text[i, DATA_WORD];
    var width = text[i, DATA_WORD_WIDTH];
    var word_next = text[i+1, DATA_WORD];
    var width_next = text[i+1, DATA_WORD_WIDTH];

    // Next line
    if word == "#"
    {
        paragraph = paragraph_size;
        posy += pspace;
        pos = i+1;
        ww = 0;
        sw = paragraph;
        continue;
    }

    // Print collected line
    if word_next == "#"
    {
        cnt++;
        if cnt < 2
        {
            if cnt > 0
                draw_text(posx_min, posy, text[pos, DATA_WORD]);
        }
        else
        {
            cx = posx_min;
            for (var n=0; n < cnt; n++)
            {
                var wr = text[pos + n, DATA_WORD];
                var wd = text[pos + n, DATA_WORD_WIDTH];
                draw_text(cx, posy, wr);
                cx += wd + hspace;
            }
        }
        posy += vspace;
        cnt = 0;
        continue;
    }
    
    if ((ww + sw + width + hspace + width_next) <= maximum_width) or (width > maximum_width)
    {
        ww += width;
        sw += hspace;
        cnt++;
        continue;
    }
    else
    {
        ww += width;
        cnt++;
    }

    // Draw line
    if cnt > 1
    {
        var sp = (posx_max - posx_min - paragraph - ww) / (cnt-1);

        cx = posx_min + paragraph;
    
        for (var n=0; n<cnt-1; n++)
        {
            var wr = text[pos + n, DATA_WORD];
            var wd = text[pos + n, DATA_WORD_WIDTH];
            draw_text(round(cx), posy, wr);
            cx += wd + sp;
        }
        wr = text[pos + n, DATA_WORD];
        wd = text[pos + n, DATA_WORD_WIDTH];
        draw_text(posx_max - wd, posy, wr);
    }
    
    posy += vspace;
    cnt = 0;
    ww = 0;
    sw = 0;
    pos = i+1;
    paragraph = 0;
}

return posy - posy_start;

