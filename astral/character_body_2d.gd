extends CharacterBody2D

@export var speed: float = 74 # pixels/sec
var mooving: bool = false
var player_pos: Vector2
var input

func _ready():
	$HealthIcon.play()

func _animate_and_moove_single_key():
	if Input.is_action_pressed("move_right"):
		$MovementChar.play("Right")
		input.x += 1
	if Input.is_action_pressed("move_left"):
		$MovementChar.play("Left")
		input.x -= 1
	if Input.is_action_pressed("move_up"):
		$MovementChar.play("Up")
		input.y -= 1
	if Input.is_action_pressed("move_down"):
		$MovementChar.play("Down")
		input.y += 1
		
func _animate_double_key():
	if Input.is_action_pressed("move_down") && Input.is_action_pressed("move_right"):
		$MovementChar.play("DownRight")
	if Input.is_action_pressed("move_down") && Input.is_action_pressed("move_left"):
		$MovementChar.play("DownLeft")
	if Input.is_action_pressed("move_up") && Input.is_action_pressed("move_right"):
		$MovementChar.play("UpRight")
	if Input.is_action_pressed("move_up") && Input.is_action_pressed("move_left"):
		$MovementChar.play("UpLeft")
	
func _physics_process(_delta: float) -> void:
	player_pos = global_position
	input = Vector2.ZERO
	
	_animate_and_moove_single_key()
	_animate_double_key()
	
	if input != Vector2.ZERO:
		input = input.normalized()
		mooving = true
	else:
		mooving = false

	velocity = input * speed
	move_and_slide()

	if !mooving:
		$MovementChar.play("Normal")
	move_and_slide()
