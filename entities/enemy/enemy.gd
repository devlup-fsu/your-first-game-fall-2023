extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/enemy_laser.tscn")

@onready var SHOOT_DELAY: Timer = $ShootDelay


func _process(_delta):
    if SHOOT_DELAY.is_stopped():
        LaserSpawner.spawn(LASER_SCENE, global_position, -90)
        SHOOT_DELAY.start(2)
