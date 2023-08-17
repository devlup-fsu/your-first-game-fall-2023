extends CharacterBody2D

const LASER_SCENE: PackedScene = preload("res://entities/laser/enemy_laser.tscn")

@export var MAX_HEALTH = 5
@export var SPEED = 150.0
@export var SHOOT_DELAY = 1.0
@export var MAX_Y = 80
@export var MIN_Y = 720 - 80

var health = MAX_HEALTH
var attacking = false
var spawning = true
var moving_up: bool = randi() % 2

@onready var spawn_goal = position.x - randi_range(300, 700)


func _physics_process(delta):
    move(delta)
    

func move(delta: float):
    if spawning:
        position.x = move_toward(position.x, spawn_goal, SPEED * 2 * delta)
        if position.x == spawn_goal:
            spawning = false
    elif not attacking:
        position.y = move_toward(position.y, MAX_Y if moving_up else MIN_Y, SPEED * delta)
        if position.y == MAX_Y:
            moving_up = false
        elif position.y == MIN_Y:
            moving_up = true
        
        if randi_range(0, 100) == 0:
            attack()


func attack():
    attacking = true
    
    $ShootDelay.start(SHOOT_DELAY)
    await $ShootDelay.timeout
    
    var laser_spawner = Globals.get_laser_spawner()
    if laser_spawner:
        laser_spawner.spawn(LASER_SCENE, global_position, -90)
    
    $ShootDelay.start(SHOOT_DELAY)
    await $ShootDelay.timeout
    
    attacking = false


func damage(amount: int):
    health -= amount
    if health <= 0:
        queue_free()
