class_name Player extends CharacterBody2D

const laser_scene: PackedScene = preload("res://laser/laser.tscn") 

@export var speed = 25000.0
@export var friction = speed / 10

@onready var shoot_delay: Timer = $ShootDelay
@onready var lasers: Node2D = get_tree().root.get_node("Game/Lasers")


func _process(_delta):
    if Input.is_action_pressed("player_shoot") and shoot_delay.is_stopped():
        var laser: Laser = laser_scene.instantiate()
        lasers.add_child(laser)
        laser.create(global_position)
        shoot_delay.start()


func _physics_process(delta):
    var direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
    if direction:
        velocity = direction * speed * delta
    else:
        velocity.x = move_toward(velocity.x, 0, friction * delta)
        velocity.y = move_toward(velocity.y, 0, friction * delta)

    move_and_slide()
