///glr_set_ambient_daytime_colors(midnight, sunrise, noon, afternoon, evening)

/*
    <=============== DESCRIPTION ===============>
        Sets the color used by the function
        glr_set_ambient_daytime
        
        HINT
        you can use make_color_rgb or make_color_hsv
        to create a color
        
    <===============  ARGUMENTS  ===============>
        midnight: gamemaker color
        sunrise: gamemaker color
        noon: gamemaker color
        afternoon: gamemaker color
        evening: gamemaker color
        
    <===============  EXAMPLE  ===============>
        glr_set_ambient_daytime_colors(c_white, c_red, c_blue, make_color_rgb(20,100,200), make_color_hsv(200,200,100));
    <===========================================>
*/


//Daytime

//midnight
global.GLR_M_R = colour_get_red(argument0);
global.GLR_M_G = colour_get_green(argument0);
global.GLR_M_B = colour_get_blue(argument0);

//sunrise
global.GLR_S_R = colour_get_red(argument1);
global.GLR_S_G = colour_get_green(argument1);
global.GLR_S_B = colour_get_blue(argument1);


//noon
global.GLR_N_R = colour_get_red(argument2);
global.GLR_N_G = colour_get_green(argument2);
global.GLR_N_B = colour_get_blue(argument2);


//afternoon
global.GLR_A_R = colour_get_red(argument3);
global.GLR_A_G = colour_get_green(argument3);
global.GLR_A_B = colour_get_blue(argument3);


//evening
global.GLR_E_R = colour_get_red(argument4);
global.GLR_E_G = colour_get_green(argument4);
global.GLR_E_B = colour_get_blue(argument4);
