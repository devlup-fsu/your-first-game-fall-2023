extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/laser.tscn")

@export var SPEED = 700.0
@export var MAX_HEALTH = 5

var health = MAX_HEALTH


func _process(_delta):
    if Input.is_action_pressed("player_shoot") and $ShootDelay.is_stopped():
        var laser_spawner = Globals.get_laser_spawner()
        if laser_spawner:
            laser_spawner.spawn(LASER_SCENE, global_position, 90)
        
        $ShootDelay.start(0.25)


func _physics_process(_delta):
    var direction = Input.get_axis("player_up", "player_down")
    if direction:
        velocity.y = direction * SPEED
    else:
        velocity.y = 0

    move_and_slide()


func damage(amount: int):
    health -= amount
    if health <= 0:
        queue_free()
