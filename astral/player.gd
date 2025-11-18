extends Node2D

@export var speed = 0.5 # How fast the player will move (pixels/sec).
@export var mooving = false;
@export var player_pos = 0.0
var screen_size # Size ofs the game window.

func _process(delta):
	player_pos = position
	if Input.is_action_pressed("move_right"):
		$MovementChar.play("Right")
		position.x += speed
	if Input.is_action_pressed("move_left"):
		$MovementChar.play("Left")
		position.x -= speed
	if Input.is_action_pressed("move_up"):
		$MovementChar.play("Up")
		position.y -= speed
	if Input.is_action_pressed("move_down"):
		$MovementChar.play("Down")
		position.y += speed
	
	if player_pos != position:
		mooving = true
	else:
		mooving = false
		
	if !mooving:
		$MovementChar.play("Normal")
	move_and_slide()
