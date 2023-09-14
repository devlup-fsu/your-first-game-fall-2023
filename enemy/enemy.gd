extends CharacterBody2D

const LASER_SCENE = preload("res://laser/enemy_laser.tscn")

@export var MAX_HEALTH = 5

var health = MAX_HEALTH

@export var SPEED = 150.0
@onready var spawn_goal = position.x - randi_range(300, 1000)

var spawning = true
var attacking = false
var moving_up = randi() % 2

func _physics_process(delta):
    if spawning:
        position.x = move_toward(position.x, spawn_goal, SPEED * 2 * delta)
        if position.x == spawn_goal:
            spawning = false
    elif not attacking:
        var move_goal = Globals.MAX_HEIGHT if moving_up else Globals.MIN_HEIGHT
        position.y = move_toward(position.y, move_goal, SPEED * delta)
        if position.y == Globals.MAX_HEIGHT:
            moving_up = false
        elif position.y == Globals.MIN_HEIGHT:
            moving_up = true
        
        if randi_range(0, 100) == 0:
            attacking = true
            $ShootDelay.start(1)
            await $ShootDelay.timeout
            
            Globals.spawn_laser(LASER_SCENE, global_position, -90)
            
            $ShootDelay.start(1)
            await $ShootDelay.timeout
            attacking = false

func damage():
    health = health - 1
    if health <= 0:
        queue_free()
