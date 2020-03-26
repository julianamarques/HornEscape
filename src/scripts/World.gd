extends Node2D


func _ready() -> void:
	yield(get_tree().create_timer(2), "timeout")
	$CanvasLayer/Hint.hide()
