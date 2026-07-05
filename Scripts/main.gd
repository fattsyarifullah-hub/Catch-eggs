extends Node2D

var score := 0
var life := 5

@onready var gameover_label: Label = $UI/GameOverLabel
@onready var restart_button: Button = $RestartButton
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

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

func lose_life() :
	life -= 1
	
	health_life()
	
	if life <= 0 :
		game_over()
		
		
func play_score_sound() :
	score_sound.play()

func game_over() :
	restart_button.show()
	gameover_label.show()
	$EggSpawnTime/Timer.stop()
	$Player.can_move = false
	get_tree().paused = true
	
	
func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
