///scrFinishExecution(player sprite)

// Create the player and assign relevant properties.
player = instance_create(x, y, objPlayer)
player.sprite_index = argument0
player.ammo = ammo
player.px = px
player.py = py

// Fully restore the player's health.
player.hp += player.max_hp
sound_ps(sndCollectHealth)
create_health_number(player.max_hp, 1)
global.screeneffect = 16

// Move the player out of any solid objects if collisions are active.
with player {
    scrMoveSolidOn()
    if !place_free(x, y) {
        x = px
        y = py
    }
    scrMoveSolidOff()
}

// Create visual effects.
objEffector.blackalpha = 1

// If the HUD is enabled, create visual points.
create_points("EXECUTION +200")

// Add to score and destroy object.
global.myscore += 200
global.combo += 1
global.combotime = 240
global.kills += 1
instance_destroy()

objEffector.letterbox = false
sound_ps(sndCriticalHit)
//sound_ps(choose(voAnarchic, voBrutal, voCruel, voDirty, voSadistic, voSavage, voSensational))
