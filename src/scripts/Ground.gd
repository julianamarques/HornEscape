extends StaticBody2D


var speed = 0
var is_moving = false
var score = 0

func _ready() -> void:
	pass
	
func increment_score(body: Node):
	if body.name == "Player":
		get_tree().call_group("score_group", "calculate_score")
	
func _process(delta: float) -> void:
	position.x += speed * delta
	
	#if position.x > get_viewport_rect().size.x + 200:
	#	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if (body.name == "Player") and not is_moving:
		is_moving = true
		get_tree().call_group("obstacles", "generate_obstacles", position.x)

func _on_fence_body_entered_score(body: Node) -> void:
	increment_score(body)

func _on_fence2_body_entered_score(body: Node) -> void:
	increment_score(body)
