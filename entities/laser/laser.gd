class_name Laser extends Area2D

@export var SPEED = 500.0

var has_hit = false


func _process(delta):
    if has_hit: return
    
    position += Vector2.UP.rotated(rotation) * SPEED * delta


func _on_body_entered(body: Node2D):
    if has_hit: return
    
    $StarSprite.visible = true
    $LaserSprite.visible = false
    
    $StarSprite.rotation_degrees = randi_range(0, 90)
    
    has_hit = true
    
    await get_tree().create_timer(0.5).timeout
    
    queue_free()
