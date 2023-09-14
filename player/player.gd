extends CharacterBody2D

const LASER_SCENE = preload("res://laser/laser.tscn")

@export var SPEED = 500.0

func _physics_process(delta):
    if Input.is_action_pressed("player_shoot") and $ShootDelay.is_stopped():
        Globals.spawn_laser(LASER_SCENE, global_position, 90)
        
        $ShootDelay.start(0.25)
        
    
    var direction = Input.get_axis("player_up", "player_down")

    if direction != 0:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0
    
    move_and_slide()

func damage():
    Globals.health = Globals.health - 1
    
    if Globals.health == 0:
        queue_free()
