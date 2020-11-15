extends Control
var DATABASE_PATH="user://"

var filelist = []
var index

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(OS.get_user_data_dir())
	_dir_contents(DATABASE_PATH)
	#print(filelist)
	index = filelist.size()
	$RegisterRect/VBoxContainer/Password.secret = true


func _dir_contents(DATABASE_PATH):
	var dir = Directory.new()
	if dir.open(DATABASE_PATH) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name!="":
			if !dir.current_is_dir():
				#print("Found file: " + file_name)
				if file_name != ".DS_Store":
					filelist.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

	
func _save():
	var file = File.new()
	index +=1
	var DATABASE_FILE=DATABASE_PATH + "user" + str(index) + ".json"
	file.open(DATABASE_FILE,File.WRITE)
	var new_user ={
		"Username": $RegisterRect/VBoxContainer/Username.text,
		"Password": $RegisterRect/VBoxContainer/Password.text
		}
	file.seek_end()
	file.store_string(to_json(new_user))
	prints("Saving to", file.get_path_absolute())
	#file.store_string("\n"+to_json(user_info))
	file.close()

func _load_user():
	var file = File.new()
	for f in filelist:
		var DATABASE_FILE = DATABASE_PATH+f
		if file.file_exists(DATABASE_FILE):
			file.open(DATABASE_FILE, File.READ)
			var cnt_users = file.get_as_text()
			#print(cnt_users)
			file.close()
		else:
			_pop_no_file()

func _on_Register_pressed():
	#_load_user()
	_save()
	_dir_contents(DATABASE_PATH)
	_load_user()
	if($RegisterRect/VBoxContainer/Username.text !="" && $RegisterRect/VBoxContainer/Password.text !=""):	
		_pop_good()
	else:
		_pop_bad()
	
		

func _pop_good():
	$RegisterRect/pop_good.visible = true
	$RegisterRect/pop_good.get_ok().connect("pressed", self, "_change_scene")

func _pop_bad():
	$RegisterRect/pop_bad.visible = true

func _pop_no_file():
	$RegisterRect/pop_no_file.visible = true
	
func _change_scene():
	get_tree().change_scene("res://Login1.tscn")
	print("Change to login page")


func _on_Register2Login_pressed():
	_change_scene()
