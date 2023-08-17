//Standard controls.
if keyboard_check_direct(ord(global.leftkey)) {
    if myxspeed > -(myspeed) myxspeed -= 0.5
    else myxspeed = -(myspeed)
    
}

if keyboard_check_direct(ord(global.rightkey)) {
    if myxspeed < (myspeed) myxspeed += 0.5
    else myxspeed = (myspeed)
}

if keyboard_check_direct(ord(global.upkey)) {
    if myyspeed > -(myspeed) myyspeed -= 0.5
    else myyspeed = -(myspeed)
}

if keyboard_check_direct(ord(global.downkey)) {
    if myyspeed < (myspeed) myyspeed += 0.5
    else myyspeed = (myspeed)
}

//Handle multidirectional input.
if (!keyboard_check_direct(ord(global.rightkey)) and!keyboard_check_direct(ord(global.leftkey))) {
    if myxspeed > 0 myxspeed -= 0.5
    else {
        if myxspeed < -0.5 myxspeed += 0.5
        else myxspeed = 0
    }
}

if (!keyboard_check_direct(ord(global.upkey)) and!keyboard_check_direct(ord(global.downkey))) {
    if myyspeed > 0 myyspeed -= 0.5
    else {
        if myyspeed < -0.5 myyspeed += 0.5
        else myyspeed = 0
    }
}
