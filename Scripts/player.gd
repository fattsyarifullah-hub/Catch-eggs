extends CharacterBody2D

var can_move = true
@export var speed := 1100.0

@export var left_limit := 0.0

@export var right_limit := 1200.0

@onready var freeze_timer = $FreezeTimer

func _process( delta ):
	if !can_move :
		return
	
	var direction := 0
	
	if Input.is_action_pressed("Move_left") :
		direction = -1
		
	if Input.is_action_pressed("Move_right") :
		direction = 1
		
	position.x += direction * speed * delta
	
	position.x = clamp(position.x, left_limit, right_limit)

func touch_cracked_egg():
	can_move = false
	freeze_timer.start()

func _on_freeze_timer_timeout() -> void:
	can_move = true # Replace with function body.
