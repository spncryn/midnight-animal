/// array_create_ext(value, ...)

/******************************************************************************
16 arguments max

Examples:

res = array_create_ext(10, 20, 30)    -> res[0] = 10
                                         res[1] = 20
                                         res[2] = 30

res = array_create_ext("A", "B", "C") -> res[0] = "A"
                                         res[1] = "B"
                                         res[2] = "C"
******************************************************************************/

var res = array_create(argument_count);

for (var i=0; i<argument_count; i++)
{
    res[i] = argument[i];
}

return res;

