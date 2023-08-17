extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/enemy_laser.tscn")

@export var MAX_HEALTH = 5

var health = MAX_HEALTH


func _process(_delta):
    if $ShootDelay.is_stopped():
        var laser_spawner = Globals.get_laser_spawner()
        if laser_spawner:
            laser_spawner.spawn(LASER_SCENE, global_position, -90)
        
        $ShootDelay.start(2)


func damage(amount: int):
    health -= amount
    if health <= 0:
        queue_free()
