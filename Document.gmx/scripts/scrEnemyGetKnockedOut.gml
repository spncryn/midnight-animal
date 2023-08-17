my_id = instance_create(x, y, objKnockedOut)
if object_get_parent(argument0) = objEnemy my_id.sprite_index = sprEGetUp
    //if argument0 = objEnemyFat or argument0 = objEnemyFatStatic or argument0 = objEnemyFatGun my_id.sprite_index = sprEFatGetUp

my_id.direction = argument1
my_id.speed = 1 + random(2)
my_id.friction = 0.15
my_id.image_angle = my_id.direction
with my_id move_outside_solid(other.angle - 180, 16)
my_id.startx = my_id.x
my_id.starty = my_id.y

global.myscore += 50
global.combotime = 240
scrEnemyDropWeapon()

instance_destroy()
