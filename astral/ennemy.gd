extends CharacterBody2D

@export var speed: float = 50.0
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

func _ready():
	player = get_tree().get_first_node_in_group("player")
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		var distance = global_position.distance_to(player.global_position)

		print(distance)
		if distance > 60: #only move if not too close
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
			#ATTAQUE SPECIAL
		move_and_slide()

		# Choose animation based on direction
		if velocity.length() > 0.1: # moving
			if abs(velocity.x) > abs(velocity.y):
				if velocity.x > 0:
					$AnimatedSprite2D.play("Right")
				else:
					$AnimatedSprite2D.play("Left")
			else:
				if velocity.y > 0:
					$AnimatedSprite2D.play("Down")
				else:
					$AnimatedSprite2D.play("Up")
		else:
			$AnimatedSprite2D.stop()
