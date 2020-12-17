extends TouchScreenButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_on_TextureButton_pressed")
	 # Replace with function body.


#func _on_TouchScreenButton_pressed():
#	#Global.play_audio(Global.BUTTON)
#	Global.goto_scene("res://flay_bird_game/Scenes/Game.tscn")


		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
#	Global.play_audio(Global.BUTTON)
	Global.goto_scene("res://flay_bird_game/Scenes/Game.tscn")
