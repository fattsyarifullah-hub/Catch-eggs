extends Node2D

@export var speed := 1000.0

@export var left_limit := -50.0

@export var right_limit := 1000.0

func _process( delta ):
	var direction := 0
	
	if Input.is_action_pressed("move_left") :
		direction = -1
		
	if Input.is_action_pressed("Move_right") :
		direction = 1
		
	position.x += direction * speed * delta
	
	position.x = clamp(position.x, left_limit, right_limit)


func _on_spawn_timer_timeout() -> void:
	pass # Replace with function body.
