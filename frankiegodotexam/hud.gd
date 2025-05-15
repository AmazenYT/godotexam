extends CanvasLayer
@export var lives:int

func show_message(text):
	$GameOverMessage.text = text
	$GameOverMessage.show()
	$GameOverTimer.start()

func show_game_over():
	show_message("Game Over")
	await $GameOverTimer.timeout

func _on_game_over_timer_timeout() -> void:
	$GameOverMessage.hide()
	pass # Replace with function body.
	
func update_lives(lives:int):
	$Lives.text = str(lives)
