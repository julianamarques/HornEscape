extends Node2D


export (PackedScene) var obstacles

func _ready() -> void:
	pass

func generate_obstacles(current_position_x) -> void:
	var new_obstacles = obstacles.instance()
	new_obstacles.position.x = 1400 + current_position_x
	add_child(new_obstacles)
	
