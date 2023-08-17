extends Node


func get_laser_spawner():
    return get_node_or_null("/root/Main/LaserSpawner")


func get_player():
    return get_node_or_null("/root/Main/Player")
