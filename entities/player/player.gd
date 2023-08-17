extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/laser.tscn")

@export var SPEED = 700.0


func _process(_delta):
    if Input.is_action_pressed("player_shoot") and $ShootDelay.is_stopped():
        get_node("/root/Main/LaserSpawner").spawn(LASER_SCENE, global_position, 90)
        $ShootDelay.start(0.25)


func _physics_process(_delta):
    var direction = Input.get_axis("player_up", "player_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0

    move_and_slide()
