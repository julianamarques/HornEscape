extends KinematicBody2D


var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 500
const JUMP_HEIGHT = -550

func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
		
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	else:
		$AnimatedSprite.play("jump")
			
	move_and_slide(motion, UP)
	
	if position.y > get_viewport_rect().size.y:
		queue_free()
		get_tree().change_scene("res://src/scenes/Menu.tscn")

func _on_EnemyKill_body_entered(body: Node) -> void:
	if body.name == "Enemy":
		body.queue_free()

func _on_PlayerVulnerability_body_entered(body: Node) -> void:
	if body.name == "Enemy":
		queue_free()
		get_tree().change_scene("res://src/scenes/Menu.tscn")
