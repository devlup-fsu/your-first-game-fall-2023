extends Timer

const ENEMY_SCENE = preload("res://enemy/enemy.tscn")

func _physics_process(delta):
    if is_stopped():
        var enemy = ENEMY_SCENE.instantiate()
        enemy.position.x = 1350
        enemy.position.y = randi_range(Globals.MIN_HEIGHT, Globals.MAX_HEIGHT)
        add_child(enemy)
        start(3)
