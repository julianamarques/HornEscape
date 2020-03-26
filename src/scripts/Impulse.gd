extends Area2D



func _on_Impulse_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.position.x = -600
