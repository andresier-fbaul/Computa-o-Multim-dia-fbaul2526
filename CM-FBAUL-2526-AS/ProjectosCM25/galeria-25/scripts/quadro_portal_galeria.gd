extends Node3D

# colocar a cena para onde tele-transportar no inspector da 'maingaleria'
@export var outra_cena : PackedScene = null
@export var textura_outra_cena : Texture = null

@onready var mesh_instance_3d: MeshInstance3D = $Area3D/MeshInstance3D

func _ready() -> void:
	if textura_outra_cena != null:
		print("set texture: ")
		mesh_instance_3d.get_active_material(0).albedo_texture = textura_outra_cena

func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if body.name != "Jogador":
		print("body coliding here is not Jogador ", self, " : ", body.name )
		return
	
	if outra_cena == null:
		print("falta por a cena no inspector! ", self)
		return
	
	await get_tree().create_timer(0.25).timeout
	
	get_tree().change_scene_to_packed(outra_cena)
		
