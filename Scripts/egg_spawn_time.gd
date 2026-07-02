extends Node2D

@export var egg_scene : PackedScene 

@export var left_margin := 30.0
@export var right_margin := 30.0

@export var spawn_y := -10.0

func _on_spawn_timer_timeout() :
	
	var egg = egg_scene.instantiate()
	
	var screen_width = get_viewport_rect().size.x
	
	var random_x = randf_range(left_margin, screen_width - right_margin)
	
	egg.position = Vector2(random_x, spawn_y)
	
	get_parent().add_child(egg)
