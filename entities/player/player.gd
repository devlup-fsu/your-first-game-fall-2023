extends CharacterBody2D

@export var SPEED = 700.0

@onready var TIMER = $Timer


func _process(_delta):
    if Input.is_action_pressed("player_shoot") and TIMER.is_stopped():
        LaserSpawner.spawn(global_position, 90)
        TIMER.start(0.25)


func _physics_process(_delta):
    var direction = Input.get_axis("player_up", "player_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0

    move_and_slide()
