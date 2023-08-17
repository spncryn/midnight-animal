/// init_enemy(health)
hit = 0 // Player attacks enemy
hitdelay = 10 // Player attacks enemy
_hit = 0 // Enemy attacks player
_hitdelay = 10 // Enemy attacks player
hp = argument0
max_hp = hp
hp_norm = (hp / max_hp) * 100
accuracy = 1

eflash = false
hit_enemy = false

// Effects.
affected = false
flashed = 0
burning = 0
shocked = 0
effect_duration = room_speed * 3

reload=10
chasereload=-1
checkreload=random(30)
lookreload=random(10)
alert = 0

path=path_add()
path_set_closed(path,false)
check=1
startx=x
starty=y
startdir=direction
direction = image_angle 

image_speed=0
returning=0
armed=1
ammo = 0
dropped = 0
dir = 0
findwall = 0
diradd=0
left=1

alertwait=-1
angle = direction
alarm[0]=random(100)
weaponfind=0

light = 0
hp_alpha = 0
direffect=8-random(16)
