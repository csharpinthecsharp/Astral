extends Node2D

@export var ennemy: PackedScene

func _ready() -> void:
	$AudioStreamPlayer.play()
	var i = 0
	while i < 1:
		spawn_mob()
		i+=1

func spawn_mob() -> void:
	if ennemy:
		var mob = ennemy.instantiate()
		# Choose a random location on Path2D.
		var mob_spawn_location = $Spawn.position * randf()
		# Set the mob's position to the random location.
		mob.global_position = $Spawn.global_position
		add_child(mob)
	else:
		print("Ennemy failed to spawn.")
