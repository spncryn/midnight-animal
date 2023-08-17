///Movement of the character

//scr_movement(x_movement, y_movement);

x += argument0;
if (place_meeting(x, y, _SOLID)){
    while(place_meeting(x, y, _SOLID)){
        x -= sign(argument0);
    }
}

y += argument1;
if (place_meeting(x, y, _SOLID)){
    while(place_meeting(x, y, _SOLID)){
        y -= sign(argument1);
    }
}
