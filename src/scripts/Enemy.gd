extends StaticBody2D

#var flip = false
var initial_position
var final_position
var velocity = 0.2

func _ready() -> void:
	$AnimatedSprite.play("run")
	initial_position = $".".position.x
	final_position = initial_position - 600
		
func _process(delta: float) -> void:
	if initial_position >= final_position:
		$".".position.x -= velocity
		$AnimatedSprite.flip_h = true
		
		#if $".".position.x >= final_position:
		#	flip = true
			
	#if $".".position.x >= initial_position:
	#	$".".position.x -= velocity
	#	$AnimatedSprite.flip_h = true
		
		#if $".".position.x <= initial_position:
		#	flip = true
