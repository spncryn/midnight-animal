sound_ps(choose(sndGlass1, sndGlass2))
repeat (16 + random(8)) {
    money = instance_create(x, y, objCoin)
    money.direction = random(360)
    money.speed = random_range(2, 4)
    money.friction = 0.15
}

repeat (24 + random(24)) {
    money = instance_create(x, y, objMoney)
    money.direction = random(360)
    money.speed = random_range(2, 4)
    money.friction = 0.15
}
