extends Node

var health = 0
var food = 0
var level = 0
var pos_x = 0
var pos_y = 0
var save_path = "user://astral-godot.save"

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var game_data = [health, food, level, pos_x, pos_y]
	file.store_var(game_data)   # save entire array
	file.close()

func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var game_data = file.get_var()   # load entire array
		file.close()

		# assign back
		health = game_data[0]
		food   = game_data[1]
		level  = game_data[2]
		pos_x  = game_data[3]
		pos_y  = game_data[4]
	else:
		print("Failed to retrieve data")
		health = 0
		food = 0
		level = 0
		pos_x = 0
		pos_y = 0
