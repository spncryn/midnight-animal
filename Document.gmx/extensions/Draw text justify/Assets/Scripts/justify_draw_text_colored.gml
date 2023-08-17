/// justify_draw_text_colored(prepared_text, left, right, top, font, [first_line_indent, space_width, space_height])
// use -1 in [first_line_indent, space_width, space_height] for default values
// example:
// justify_draw_text(text, 100, room_width - 100, 0, myfont, 80, 8, -1]
// justify_draw_text(text, 100, room_width - 100, 0, myfont, -1, 8, -1]

if argument_count != 5 and argument_count != 8
{
    draw_text(argument[1], argument[3], "[justify_draw_text] Error. Invalid arguments!");
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

var paragraph_size = 50;
var hspace = 4;
var vspace = string_height("1j") + 5;

if argument_count > 5
{
    if argument[5] >= 0
        paragraph_size = argument[5];
    if argument[6] >= 0
        hspace = argument[6];
    if argument[7] >= 0
        vspace = argument[7];
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

var tags_number = 0;

for (var i=0; i<sz-1; i++)
{
    if text[i, TEXT_TYPE] = TYPE_TAG
    {
        cnt++;
        tags_number++;
        continue;
    }
    
    // Assemble line and calculate the amount of indentation
    if text[i + 1, TEXT_TYPE] = TYPE_WORD
        var shift = 1;
    else
    {
        var shift = 2;
        while text[i + shift, TEXT_TYPE] == TYPE_TAG
        {
            shift++;
        }
    }
    
    var word = text[i, TEXT_WORD];
    var width = text[i, TEXT_WORD_WIDTH];
    var word_next = text[i + shift, TEXT_WORD];
    var width_next = text[i + shift, TEXT_WORD_WIDTH];

    // Next line
    if word == "#"
    {
        paragraph = paragraph_size;
        posy += hspace;
        pos = i+1;
        ww = 0;
        sw = paragraph;
        tags_number = 0;
        cnt = 0;
        continue;
    }

    // Print collected line
    if word_next == "#"
    {
        cnt++;
        cnt++;
        if cnt - tags_number < 2
        {
            if cnt - tags_number > 0
                draw_text(posx_min, posy, text[pos, TEXT_WORD]);
        }
        else
        {
            cx = posx_min;
            for (var n=0; n<cnt; n++)
            {
                if justify_check_tags(text, pos + n) continue;
                
                var wr = text[pos + n, TEXT_WORD];
                var wd = text[pos + n, TEXT_WORD_WIDTH];
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
        var sp = (posx_max - posx_min - paragraph - ww) / (cnt - 1 - tags_number);

        cx = posx_min + paragraph;
    
        for (var n=0; n<cnt-1; n++)
        {
            if justify_check_tags(text, pos + n) continue;
            
            var wr = text[pos + n, TEXT_WORD];
            var wd = text[pos + n, TEXT_WORD_WIDTH];
            draw_text(round(cx), posy, wr);
            cx += wd + sp;
        }
        
        if !justify_check_tags(text, pos + n)
        {
            wr = text[pos + n, TEXT_WORD];
            wd = text[pos + n, TEXT_WORD_WIDTH];
            draw_text(posx_max - wd, posy, wr);
        }
    }
    
    posy += vspace;
    cnt = 0;
    ww = 0;
    sw = 0;
    pos = i + 1;
    paragraph = 0;
    tags_number = 0;
}

return posy - posy_start;

