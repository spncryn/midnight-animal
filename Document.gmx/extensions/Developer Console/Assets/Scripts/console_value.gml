/// console_value(console,value[n])
var c=argument0,n=argument1;

if !is_undefined(c[? "arguments"]) {
    var a = c[? "arguments"];
    if c[? "count"] >= n {
        if string_letters(a[n]) = "" { 
            return real(a[n]);
        } else return a[n];
    }
}


