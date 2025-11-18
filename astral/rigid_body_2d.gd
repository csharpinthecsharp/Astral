extends RigidBody2D

var speed = 200.0
var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

func _physics_process(delta: float) -> void:
	_goto_player(delta)

func _goto_player(delta: float) -> void:
	if player:
		var direction = (player.position - position).normalized()
		apply_force(direction * speed, Vector2.ZERO)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$AnimatedSprite2D.stop()
	queue_free()
