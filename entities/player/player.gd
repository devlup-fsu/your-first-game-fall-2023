extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/laser.tscn")

@export var SPEED = 700.0

@onready var SHOOT_DELAY: Timer = $ShootDelay


func _process(_delta):
    if Input.is_action_pressed("player_shoot") and SHOOT_DELAY.is_stopped():
        LaserSpawner.spawn(LASER_SCENE, global_position, 90)
        SHOOT_DELAY.start(0.25)


func _physics_process(_delta):
    var direction = Input.get_axis("player_up", "player_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0

    move_and_slide()
