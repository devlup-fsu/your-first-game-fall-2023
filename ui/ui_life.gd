extends Control


func _process(delta):
    var player = Globals.get_player()
    if player:
        $TextureRect.visible = true
        $TextureRect.size.x = 37 * player.health
    else:
        $TextureRect.size.x = 0
