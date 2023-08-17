/// justify_create_words_list(text, font)

//****************************************************
// move it to constants (macros):
DATA_WORD = 0;
DATA_WORD_WIDTH = 1;
//****************************************************/

draw_set_font(argument1);

var text = string_replace_all(argument0, chr($0d) + chr($0a), "#") + " ";

var words_list = 0;

var sz = string_length(text);   // text size
var cnt = 0;                    // words counter
var word = "";                  // current word
for (var i=1; i<sz; i++)
{
    var char = string_char_at(text, i);
    var next_char = string_char_at(text, i+1);

    // If there are more spaces in a row, add them to the word
    // Otherwise, if there are space, or newline symbol, or line end, then add the word to the list
    if (next_char != " " and (char == " " or char == "#") or i == sz-1)
    {
        if i == sz-1 word += char;
        if word != ""
        {
            words_list[cnt, DATA_WORD] = word;
            if word != "" and word != "#"
            {
                words_list[cnt++, DATA_WORD_WIDTH] = string_width(word);
            }
            else
                words_list[cnt++, DATA_WORD_WIDTH] = 0;
        }

        if char = "#" or word = ""
        {
            words_list[cnt, DATA_WORD] = "#";
            words_list[cnt++, DATA_WORD_WIDTH] = 0;
        }
        word = "";
    }
    else
    {
        word += char;
    }
}

words_list[cnt, DATA_WORD] = "#";
words_list[cnt, DATA_WORD_WIDTH] = 0;

return words_list;

