extends Node3D

var time := 0.0
var time_to_spawn := 5.0
var time_to_spawn_nxt := 0.25
var spawn_loc := Vector3(2, 10.7, 2.5)

@onready var phymeshscene = preload("res://phymesh.tscn")

func _process(delta: float) -> void:
	time += delta
	if time > time_to_spawn:
		time = 0.0
		time_to_spawn = time_to_spawn_nxt
		var phy : RigidBody3D = phymeshscene.instantiate()
		add_child(phy)
		phy.global_position = spawn_loc + Vector3( randf(), 0, (randf()-0.5)*5 )
