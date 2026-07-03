extends Area2D

func _on_area_entered(area) :
	
	if area.is_in_group("Egg") :
		var main = get_tree().current_scene
		
		main.lose_life()
		
		area.queue_free()
