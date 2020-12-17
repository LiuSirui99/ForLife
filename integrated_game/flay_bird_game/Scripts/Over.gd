extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Array,Texture)var images #0 1 2
onready var last_score = Global.last_score 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Bg/Reward/Best.text =str( Global.best_score)
	$Bg/Reward/Last.text = str(last_score)
	
	if last_score < 5:
		$Bg/Reward/Coin.texture = images[0]
	elif last_score <10:
		$Bg/Reward/Coin.texture = images[1]
	else:
		$Bg/Reward/Coin.texture = images[2]
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_pressed():
	Global.goto_scene("res://flay_bird_game/Scenes/Main.tscn")
	Global.audio_player_bg.seek(0)
	 # Replace with function body.


func _on_TextureButton_pressed():
	Global.goto_scene("res://flay_bird_game/Scenes/Main.tscn")
	Global.audio_player_bg.seek(0)
	
