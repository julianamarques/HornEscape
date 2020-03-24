extends CanvasLayer


var score = 0

func calculate_score():
	score += 1
	$ScoreText.text = str(score)
