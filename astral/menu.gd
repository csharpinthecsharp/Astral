extends Control

func _on_button_pressed() -> void:
	#get_tree().change_scene_to_file("res://Level/Level1/Boss1.tscn")
	get_tree().change_scene_to_file("res://world_1.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()
