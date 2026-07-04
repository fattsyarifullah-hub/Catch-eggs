extends Area2D

@export var fall_speed := 350.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta)  :
	position.y += fall_speed * delta
	
	var screen_height = get_viewport_rect().size.y
	
	if position.y > screen_height + 50 :
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") :
		
		var scene_main = get_tree().current_scene
		scene_main.add_score()
		
		queue_free()
		
		scene_main.play_score_sound()
