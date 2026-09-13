extends Node2D

var tempo := 0.0

func _process(delta: float) -> void:
	
	tempo += delta
	
	#$Sprite2D.offset.x = tempo * 10.0
	$Sprite2D.offset.x = sin(tempo * 2.5) * 500.0 + 500.0
	
	$Icon.offset = get_global_mouse_position()
