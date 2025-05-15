extends Node
@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$EnemyTimer.stop()
	
func new_game() -> void:
	$Player.start($PlayerStart.position)
	$StartTimer.start
	pass # Replace with function body.


func _on_start_timer_timeout() -> void:
	$EnemyTimer.start
	pass # Replace with function body.


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	
	var enemy_spawn_location = $EnemyPath/EnemySpawnLocations
	
	enemy.position = enemy_spawn_location.position
	enemy_spawn_location.progress_ratio = randf()
	
	enemy.position = enemy_spawn_location.posiiton
	
	var direction = enemy_spawn_location.rotation + PI / 2
	
	direction += randf_range(-PI / 4, PI / 4)
	enemy.rotation = direction 
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	enemy.linear_velocity = velocity.rotated(direction)
	
	add_child(enemy)
	pass # Replace with function body.
