/// console_preset(console)
var c=argument0;
s = c[? "sep"];

console_add(c,"restart - Restart current floor.");
console_add(c,"end - Terminate session.");
console_add(c,"fullscreen"+s+"(bool) - Toggle full-screen / borderless windowed.");
console_add(c,"reset - Restart session.");
console_add(c,"fps - Set FPS.");
console_add(c,"volume"+s+"(0 - 100) - Set master volume.");
console_add(c,"create"+s+"(object)"+s+"x"+s+"y (created at mouse if unspecified)");
console_add(c,"screenshot"+s+"filename.png - Save screenshot.");

c[? "preset"] = true;

