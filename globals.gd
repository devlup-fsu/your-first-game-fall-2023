extends Node

const MAX_HEIGHT = 80
const MIN_HEIGHT = 648 - 80

const MAX_HEALTH = 5
var health = MAX_HEALTH

func spawn_laser(scene, global_pos, global_rot):
    var laser = scene.instantiate()
    add_child(laser)
    laser.global_position = global_pos
    laser.global_rotation_degrees = global_rot
