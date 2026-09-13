extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name != "Jogador":
		print("body coliding here is not Jogador ", self, " : ", body.name )
		return
	
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://cenas/maingaleria.tscn")
