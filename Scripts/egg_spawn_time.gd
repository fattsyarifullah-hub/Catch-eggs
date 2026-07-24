extends Node2D

var basic_egg = preload("res://Scenes/egg.tscn")
var cracked_egg = preload("res://Scenes/cracked_egg.tscn")

@export var egg_scene : PackedScene 

@export var left_margin := 60.0
@export var right_margin := 200.0

@export var spawn_y := -5.0

func _ready() -> void:
	randomize()
	
func _on_spawn_timer_timeout() :
	var xposition = randf_range(50, 1150)
	
	var chance = randi_range(1, 10)
	
	var new_egg = null
	
	if chance <= 6 :
		new_egg = basic_egg.instantiate()
	else :
		new_egg = cracked_egg.instantiate()
		
	
	if new_egg != null :
		new_egg.position = Vector2(xposition, spawn_y)
		add_child(new_egg)
	
	
