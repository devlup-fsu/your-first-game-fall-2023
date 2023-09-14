extends Area2D


@export var SPEED = 500.0

func _physics_process(delta):
    position += Vector2.UP.rotated(rotation) * SPEED * delta


func _on_body_entered(body):
    if body.has_method("damage"):
        body.damage()
    
    queue_free()
