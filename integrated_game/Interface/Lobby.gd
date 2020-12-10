extends Node2D

onready var logInPanel = get_node("LogInPanel")
onready var textInput = get_node("ChatBox/Container/Text")
onready var sendBtn = get_node("ChatBox/Container/Send")
onready var player = get_node("Player.tscn")

func _ready():
	logInPanel.popup()

func _on_LogInPanel_popup_hide():
	player.userName = logInPanel.givenName

func _on_ChatBox_textSent():
	if textInput.text != "":
		player.get_node("Speech").text = textInput.text
		player.get_node("Speech").visible = true
		player.get_node("Speech/Timer").start(4)
