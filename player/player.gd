extends CharacterBody2D


@export var speed = 25000.0
@export var friction = speed / 10


func _physics_process(delta):
    var direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
    if direction:
        velocity = direction * speed * delta
    else:
        velocity.x = move_toward(velocity.x, 0, friction * delta)
        velocity.y = move_toward(velocity.y, 0, friction * delta)

    move_and_slide()
