extends KinematicBody2D

export (int) var speed = 200
onready var nameTag = get_node("NameTag")
var userName = "Player"

var target = Vector2(512,300)
var velocity = Vector2()

func _ready():
	nameTag.text = userName

func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
