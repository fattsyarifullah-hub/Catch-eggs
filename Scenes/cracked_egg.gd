extends Area2D

@export var fall_speed := 500.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	position.y += fall_speed * delta
	
	var screen_height = get_viewport_rect().size.y
	
	if position.y > screen_height + 50 :
		queue_free() 


func _on_body_entered(body: Node2D) -> void:
	print("player menyentuh telur basi")
	if body.is_in_group("Player") :
		print("Player terdeteksi")
		body.touch_cracked_egg()
		
		queue_free()
	
	else :
		print("Objek tidak terdeteksi")
		
