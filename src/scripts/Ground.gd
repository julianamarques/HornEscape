extends StaticBody2D


var speed = 200

#var player = preload("res://src/scenes/Player.tscn")

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	#position.x = speed * delta
	#if position.x > get_viewport_rect().size.x:
	#	queue_free()
	
	#player

	pass


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().call_group("obstacles", "generate_obstacles", position.x)
