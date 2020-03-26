extends CanvasLayer


var score = 0

func calculate_score():
	score += 1
	$ScoreText.text = str(score)
	$ScoreTextGameOver.text = str(score)

func game_over():
	$ScoreText.hide()
	$GameOver.show()
	$ScoreTextGameOver.show()
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://src/scenes/Menu.tscn")
