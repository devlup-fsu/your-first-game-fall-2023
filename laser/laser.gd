class_name Laser extends Area2D

@export var speed = 400
@export var damage = 1

@onready var laser_sprite: Sprite2D = $LaserSprite
@onready var star_sprite: Sprite2D = $StarSprite

var _hit = false

func create(global_pos: Vector2):
    global_position = global_pos


func _physics_process(delta):
    if _hit:
        return
    
    if global_position.y < -20:
        queue_free()
    
    position += Vector2.UP.rotated(rotation) * speed * delta


func _on_body_entered(body: Node2D):
    if _hit:
        return
    
    _hit = true
    
    laser_sprite.visible = false
    star_sprite.visible = true
    star_sprite.rotation_degrees = randi_range(0, 90)
    
    if body is Enemy:
        body.hurt(damage)
    
    await get_tree().create_timer(0.25).timeout
    queue_free()
