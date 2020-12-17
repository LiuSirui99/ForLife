extends RigidBody2D

var brid_type = ["red", "yellow", "blue"]
var die = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = brid_type[randi() % brid_type.size()]
	$AnimatedSprite.play()
	gravity_scale = 0

func game_start():
	gravity_scale = 10

func _input(event):
	if Global.current_state !=Global.game_state.PLAY:
		return
	if event.is_action_pressed("ui_select"):
		linear_velocity = Vector2(0,-300)
		Global.play_audio(Global.TOUCH)
#	event.is_action_pressed("ui_select")	
func _integrate_forces(state):
	if Global.current_state !=Global.game_state.PLAY:
		return
	if state.get_contact_count() > 0 and not die :
		die = true
		$AnimatedSprite.animation = "die"
		Global.current_scene.game_over() 
		Global.play_audio(Global.DIE)
		#goto scene
	pass
