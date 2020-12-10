extends PopupDialog

onready var nameInput = get_node("GridContainer/NameInput")
onready var logInButton = get_node("GridContainer/LogInButton")

var givenName = "Player"

func _ready():
	pass # Replace with function body.


func _on_LogInButton_pressed():
	if !nameInput.text.empty():
		givenName = nameInput.text
		hide()
