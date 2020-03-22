extends Node2D

var time = 0
var ground_scene = preload("res://src/scenes/Ground.tscn")
var list = []
var root = ground_scene.instance()
var current = root

func _make_scenes():
	list.push_front(current)
	while current:
		if true: # check some bool expression
			var new_node = ground_scene.instance()
			list.push_front(new_node)
			root.add_child(new_node)
		list.pop_back()
		current = null if list.empty() else list.back()
		
func _ready() -> void:
	_make_scenes()
