extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
