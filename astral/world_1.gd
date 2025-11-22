extends Node2D
var key_state = 0

func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player" && key_state == 1:
		$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Level/Level1/Boss1.tscn")

func _on_key_body_entered(body: Node2D) -> void:
	$Key/Door_Key.play()

func _on_door_key_animation_looped() -> void:
	$Key/Door_Key.stop()
	$Key/Door_Key.visible = false
	$TileMapLayer/Player/KeyIcon/Label.text = ": 1"
	key_state = 1
