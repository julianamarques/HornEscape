extends StaticBody2D


var speed = 0
var is_moving = false
var score = 0

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	position.x += -speed * delta
	
	#if position.x > get_viewport_rect().size.x + 200:
	#	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if (body.name == "Player") and not is_moving:
		is_moving = true
		get_tree().call_group("obstacles", "generate_obstacles", position.x)
