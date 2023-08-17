/// draw_flash(length of flash, time between flashes)

// From http://fauxoperativegames.com/essential_function_guide/

var _flashLength = argument0;
var _flashDelay = argument1;

var _oldFlashModFloor = floor(flashMod);

if (flashMod > 0) {
    flashMod -= 1 //* global.timeFactor;
}

var _flashModFloor = floor(flashMod);

if (
    flashMod > 0 and _oldFlashModFloor != _flashModFloor and _flashModFloor mod _flashDelay == 0
) {
    flashTimer = _flashLength;
}

if (flashTimer > 0) {
    flashTimer -= 1 //* global.timeFactor;
}

/*
CREATE:
flashMod = 0;
flashTimer = 0;

STEP:
scr_flashTimers(length_of_each_flash, delay_between_each_flash);

DRAW:
if flashTimer > 0 { shader_set(shader));}
draw_self();
shader_reset();
*/
