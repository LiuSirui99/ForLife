extends Node2D

onready var logInPanel = get_node("LogInPanel")
var player = preload("res://Player/Player.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	logInPanel.popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


func _on_LogInPanel_popup_hide():
	player.userName = logInPanel.givenName
	add_child(player)
