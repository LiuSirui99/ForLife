extends Node2D

onready var logInPanel = get_node("LogInPanel")
onready var textInput = get_node("ChatBox/Container/Text")
onready var sendBtn = get_node("ChatBox/Container/Send")
onready var player = get_node("Player")

func _on_ChatBox_textSent():
	if textInput.text != "":
		player.get_node("Speech").text = textInput.text
		player.get_node("Speech").visible = true
		player.get_node("Speech/Timer").start(4)

func _on_Area2D_body_entered(body):
	
	if(body.name == "Player"):
		get_tree().change_scene("res://outdoorWorld.tscn")
