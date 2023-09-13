extends Node

func spawn_laser(scene, global_pos, global_rot):
    var laser = scene.instantiate()
    add_child(laser)
    laser.global_position = global_pos
    laser.global_rotation_degrees = global_rot
