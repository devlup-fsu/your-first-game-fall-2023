extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/enemy_laser.tscn")


func _process(_delta):
    if $ShootDelay.is_stopped():
        get_node("/root/Main/LaserSpawner").spawn(LASER_SCENE, global_position, -90)
        $ShootDelay.start(2)
