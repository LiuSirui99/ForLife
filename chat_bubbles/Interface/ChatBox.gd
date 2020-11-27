extends PanelContainer

onready var textInput = get_node("Container/Text")
onready var sendBtn = get_node("Container/Send")

signal textSent

func _on_Send_pressed():
	emit_signal("textSent")
