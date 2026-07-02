extends Area2D

@export var fall_speed := 750.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta)  :
	position.y += fall_speed * delta
	
	var screen_height = get_viewport_rect().size.y
	
	if position.y > screen_height + 50 :
		queue_free()
