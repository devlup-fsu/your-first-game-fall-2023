extends CharacterBody2D

@export var SPEED = 500.0


func _physics_process(delta):
    var direction = Input.get_axis("player_up", "player_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0

    move_and_slide()
