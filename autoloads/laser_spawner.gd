extends Node2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/laser.tscn")


func spawn(global_pos: Vector2, rotation_deg: float):
    var laser = LASER_SCENE.instantiate()
    add_child(laser)
    laser.global_position = global_pos
    laser.rotation_degrees = rotation_deg
