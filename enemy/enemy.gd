class_name Enemy extends CharacterBody2D

@export var max_health = 5

var health = max_health


func hurt(damage: int):
    health -= damage
    if health <= 0:
        queue_free()
