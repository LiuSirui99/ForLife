extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_x = 100
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	game_ready()
	
	


func game_ready():
	Global.current_state = Global.game_state.READY
	$HUB/Ready.show()
	$HUB/Score.hide()
	$HUB/ReadyTimer.start()
	
	
func game_start():
	Global.current_state = Global.game_state.PLAY
	$HUB/Ready.hide()
	$HUB/Score.show()
	$HUB/Score.text	 = str(score)
	
	$Pipes/PipeTimer.start()
	$Brid.game_start()
func game_over():
	Global.last_score = score
	Global.load_score()
	if score > Global.best_score:
		Global.best_score = score
	
	
	Global.current_state = Global.game_state.OVER
	$Pipes/PipeTimer.stop()
	yield(get_tree().create_timer(1.5),"timeout")
	Global.goto_scene("res://flay_bird_game/Scenes/Over.tscn")
	
func add_score():
	score += 1
	$HUB/Score.text	 = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.current_state != Global.game_state.PLAY:
		return
	$BgBackground.scroll_offset.x -= delta*offset_x
	$TopBackground.scroll_offset.x -= delta * offset_x
	$BottomBackground.scroll_offset.x -= delta * offset_x


func _on_ReadyTimer_timeout():
	game_start()
