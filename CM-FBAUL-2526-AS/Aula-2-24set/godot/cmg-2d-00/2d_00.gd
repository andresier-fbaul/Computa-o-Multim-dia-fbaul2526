extends Node2D

func _ready():
	print("Ola")
	pass

func _process(delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	draw_circle(
		Vector2(randi_range(0, 1000),randi_range(0,800)) , #get_global_mouse_position(),   # Vector2(200, 300),
		150,
		Color(244,125,10) #Color.AQUA
	)
