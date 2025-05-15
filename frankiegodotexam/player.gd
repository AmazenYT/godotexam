extends Area2D
signal hit

const SPEED = 300.0
var screen_size
var lives:int = 5

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_body_entered(body: Node2D) -> void:
	lives -= 1
	if lives == 0:
		hide()
		hit.emit()
		$CollisionShape2D.set_deferred("disabled", true)
	
	pass # Replace with function body.
