extends Node2D

func spawn(scene: PackedScene, global_pos: Vector2, rotation_deg: float):
    var laser = scene.instantiate()
    add_child(laser)
    laser.global_position = global_pos
    laser.rotation_degrees = rotation_deg
