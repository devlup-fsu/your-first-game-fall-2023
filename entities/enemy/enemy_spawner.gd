extends Node2D

@onready var ENEMY_SCENE = preload("res://entities/enemy/enemy.tscn")


func _process(_delta):
    if $SpawnTimer.is_stopped():
        var enemy = ENEMY_SCENE.instantiate()
        enemy.position.x = 1350
        enemy.position.y = randi_range(enemy.MAX_Y, enemy.MIN_Y)
        add_child(enemy)
        $SpawnTimer.start(3)
