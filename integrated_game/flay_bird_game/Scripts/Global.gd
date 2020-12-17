extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const FILE_PTAH = "user://fly_game.o"

enum game_state {READY, PLAY, OVER}
enum {BG, BUTTON, DIE, TOUCH, SCORE}


onready var audio_bg = preload("res://flay_bird_game/Assets/Audios/Bg.ogg")
onready var audio_button = preload("res://flay_bird_game/Assets/Audios/sfx_button.wav")
onready var audio_die = preload("res://flay_bird_game/Assets/Audios/sfx_die.wav")
onready var audio_score = preload("res://flay_bird_game/Assets/Audios/sfx_score.wav")
onready var audio_touch = preload("res://flay_bird_game/Assets/Audios/sfx_touch.wav")
onready var audio_player_bg = AudioStreamPlayer.new()

var current_state = null
var current_scene = null

var last_score = 0
var best_score = 0 setget set_score

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
#	var root = get_tree().get_root()
	var root = get_tree().get_root()
#	current_scene = root.get_child(root.get_child_count()-1)
	current_scene = root.get_child(root.get_child_count()-1)
#	play_audio(BG)
	

func goto_scene(path):
#	play_audio(BG)
	print(current_scene)
#	current_scene.free()
	call_deferred("_deferred_goto_scene",path)
	

func _deferred_goto_scene(path):

	var wr = weakref(current_scene)
#	if (!wr.get_ref()):
#		current_scene.queue_free()
#	else:
	current_scene = current_scene
#
	if(current_scene != null):
		current_scene.queue_free()
		remove_child(current_scene)
	
	current_scene = ResourceLoader.load(path).instance()
	
	get_tree().get_root().add_child(current_scene)
	
	get_tree().current_scene = current_scene


func play_audio(audio_name):
	if audio_name == BG:
		add_child(audio_player_bg)
		audio_player_bg.stream = audio_bg
		audio_player_bg.play()
		return
	
	var audio_player_sfx = AudioStreamPlayer.new()
	#, BUTTON, DIE, TOUCH, SCORE}
	match audio_name:
		BUTTON:
			audio_player_sfx.stream = audio_button
		DIE:
			audio_player_sfx.stream = audio_die
		TOUCH:
			audio_player_sfx.stream = audio_touch
		SCORE:
			audio_player_sfx.stream = audio_score
		
	add_child(audio_player_sfx)
	audio_player_sfx.play()
	yield(audio_player_sfx,"finished")
	audio_player_sfx.queue_free()
	
	

func set_score(value):
	best_score = value
	save_score()
func save_score():
	var file = File.new()
	file.open(FILE_PTAH,file.WRITE)
	file.store_var(best_score)
	file.close()
	
	
func load_score():
	var file = File.new()
	if file.file_exists(FILE_PTAH):
		file.open(FILE_PTAH,file.READ)
		best_score = file.get_var()
		file.close()
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
