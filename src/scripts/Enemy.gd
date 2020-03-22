extends StaticBody2D

var flip = true
var initial_position
var final_position
var velocity = 2

func _ready() -> void:
	$AnimatedSprite.play("run")
	initial_position = $".".position.x
	final_position = initial_position + 300
		
func _process(delta: float) -> void:
	if initial_position <= final_position and flip:
		$".".position.x += velocity
		$AnimatedSprite.flip_h = false
		
		if $".".position.x >= final_position:
			flip = false
			
	if $".".position.x >= initial_position and !flip:
		$".".position.x -= velocity
		$AnimatedSprite.flip_h = true
		
		if $".".position.x <= initial_position:
			flip = true
