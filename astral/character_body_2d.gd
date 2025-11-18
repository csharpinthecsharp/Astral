extends CharacterBody2D

@export var speed: float = 74 # pixels/sec
var mooving: bool = false
var player_pos: Vector2

func _physics_process(delta: float) -> void:
	player_pos = global_position

	var input = Vector2.ZERO

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

	if input != Vector2.ZERO:
		input = input.normalized()
		mooving = true
	else:
		mooving = false

	velocity = input * speed
	move_and_slide()

	if !mooving:
		$MovementChar.play("Normal")
