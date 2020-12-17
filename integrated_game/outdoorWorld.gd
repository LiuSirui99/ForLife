extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://RPGWorld.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://flay_bird_game/Scenes/Main.tscn") 
