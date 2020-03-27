extends KinematicBody2D


var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY = 25
const SPEED = 1
const JUMP_HEIGHT = -750

func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	
	motion.x += SPEED
	$AnimatedSprite.play("run")
	$AnimatedSprite.flip_h = false
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	else:
		$AnimatedSprite.play("jump")
			
	move_and_slide(motion, UP)
	
	if position.y > get_viewport_rect().size.y:
		queue_free()
		get_tree().call_group("score_group", "game_over")

func _on_EnemyKill_body_entered(body: Node) -> void:
	if body.name == "Enemy":
		body.queue_free()

#func _on_PlayerVulnerability_body_entered(body: Node) -> void:
#	if body.name == "Enemy":
#		queue_free()
#		get_tree().call_group("score_group", "game_over")
