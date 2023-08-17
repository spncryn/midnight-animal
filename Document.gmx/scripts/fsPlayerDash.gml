if scrCurrentWeaponExt(sprite_index) = 80 d_dist = 20 else d_dist = 10

DashXSpeed=d_dist*sign(myxspeed);
DashYSpeed=d_dist*sign(myyspeed);

if //(keyboard_check(vk_space) or gamepad_button_check(0, gp_shoulderl)) and 
DashTimer {
    scrMoveSolidOn()

    if DashTimer % 5 { 
        DashEffect = instance_create(x, y, objDashEffect);
        DashEffect.sprite_index = sprite_index;
        DashEffect.image_index = image_index;
        DashEffect.image_angle = dir
        DashEffect.direction = dir
    };
    
    while (abs(DashXSpeed)+abs(DashYSpeed))>30 {
        DashXSpeed*=0.5 // 0.98
        DashYSpeed*=0.5
    }
    
    if abs(DashYSpeed) > 0 {
        if scrPlaceFree(x, y + DashYSpeed) y += DashYSpeed else {
            if DashXSpeed = 0 {
                if scrPlaceFree(x - 8, y + DashYSpeed) x -= myspeed else {
                    if scrPlaceFree(x + 8, y + DashYSpeed) x += myspeed else {
                        move_contact_solid(-sign(DashYSpeed) * 90, abs(DashYSpeed))
                        DashYSpeed = 0
                    }
                }
            }
        }
    }
    
    if abs(DashXSpeed) > 0 {
        if scrPlaceFree(x + DashXSpeed, y) x += DashXSpeed else {
            if DashYSpeed = 0 {
                if scrPlaceFree(x + DashXSpeed, y - 8) y -= myspeed else {
                    if scrPlaceFree(x + DashXSpeed, y + 8) y += myspeed else {
                        move_contact_solid(90 - sign(DashXSpeed) * 90, abs(DashXSpeed))
                        DashXSpeed = 0
                    }
                }
            }
        }
    }
    
    DashTimer-=1
    
    scrMoveSolidOff()
} else {
    speed=0;
    DashTimer=5;
    state_switch("Default")
};
