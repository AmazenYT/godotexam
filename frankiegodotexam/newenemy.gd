extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	var direction
	if direction:
		velocity.x = direction * SPEED
		velocity.y = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
