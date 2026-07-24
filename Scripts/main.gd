extends Node2D

var score := 0
var life : int = 5

var texture_fill = preload("res://assets/images/heart-fill.png")
var texture_blank = preload("res://assets/images/heart-blank.png")

@onready var hearts: Array = [
	$UI/HBoxContainer/Heart1,
	$UI/HBoxContainer/Heart2,
	$UI/HBoxContainer/Heart3,
	$UI/HBoxContainer/Heart4,
	$UI/HBoxContainer/Heart5
]

@onready var gameover_label: Label = $UI/GameOverLabel
@onready var restart_button: Button = $RestartButton
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var heart_sound: AudioStreamPlayer2D = $HeartDecreSound

# Called when the node enters the scene tree for the first time.
func _ready() :
	restart_button.visible = false
	gameover_label.visible = false
	health_life()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func health_life() :
	$UI/HeartLabel.text = "Life : " + str(life)
	
func add_score() :
	score += 1
	
	$UI/ScoreLabel.text = "Score : " + str(score)
	
func play_score_sound() :
	score_sound.play()
	
	
func play_heart_sound() :
	heart_sound.play()

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_ground_area_entered(area: Area2D) -> void:
	if area.is_in_group("Egg") or area.name.begins_with("Eggs"):
		area.queue_free()
		
		lose_health()

func lose_health() -> void :
	if life > 0:
		life -= 1
		play_heart_sound()
		update_UI_health()
	
	if life <= 0:
		game_over()

func update_UI_health() -> void:
	for i in range(hearts.size()) :
		if i < life :
			hearts[i].texture = texture_fill
		else :
			hearts[i].texture = texture_blank
	
func game_over() -> void :
	restart_button.show()
	gameover_label.show()
	$EggSpawnTime/Timer.stop()
	$Player.can_move = false
	get_tree().paused = true
