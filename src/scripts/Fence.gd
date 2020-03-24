extends Area2D

func kill_fence(body: Node):
	if body.name == "Player":
		queue_free()

func _on_fence_body_entered(body: Node) -> void:
	kill_fence(body)

func _on_fence2_body_entered(body: Node) -> void:
	kill_fence(body)
