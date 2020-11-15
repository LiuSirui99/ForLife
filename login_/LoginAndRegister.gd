extends Control

var filelist = []
var database = []
var found = false
var DATABASE_PATH="user://"
# Called when the node enters the scene tree for the first time.

func _ready():
	_dir_contents(DATABASE_PATH)
	_load_user()
	$LoginRect/VBoxContainer/Password.secret = true
	
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

func _load_user():
	var file = File.new()
	for f in filelist:
		var DATABASE_FILE = DATABASE_PATH+f
		if file.file_exists(DATABASE_FILE):
			file.open(DATABASE_FILE, File.READ)
			var cnt_users = file.get_as_text()
			database.append(cnt_users)
			file.close()
		else:
			_pop_no_file()

func _on_Login_pressed():
	_load_user()
	for d in database:
		d = d.substr(2,d.length()-4)
		var split = d.split(":")
		var comma = to_json(split[1]).find(",")
		#print(split[1].substr(1,comma-5)) # password
		#print(split[2].substr(1,-1)) # username
		if($LoginRect/VBoxContainer/Username.text != split[2].substr(1,-1) || $LoginRect/VBoxContainer/Password.text != split[1].substr(1,comma-5)):
			found = false
		else:
			found = true
			break
	#print(found)
	if found:
		$LoginRect/Login_success.visible = true
		$LoginRect/Login_success.get_ok().connect("pressed", self, "_change_scene")
	else:
		$LoginRect/Login_bad.visible = true
		

func _pop_no_file():
	$LoginRect/Pop_no_file.visible = true
	
func _change_scene():
	get_tree().change_scene("res://Main_page.tscn")
	print("Change to character customized page")

func _on_Login2Register_pressed():
	get_tree().change_scene("res://Register.tscn")



