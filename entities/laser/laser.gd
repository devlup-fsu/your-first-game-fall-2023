class_name Laser extends Area2D

@export var SPEED = 500.0


func _process(delta):
    position += Vector2.UP.rotated(rotation) * SPEED * delta
