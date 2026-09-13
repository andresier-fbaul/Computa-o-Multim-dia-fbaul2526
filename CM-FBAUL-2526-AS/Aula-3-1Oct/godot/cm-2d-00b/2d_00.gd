extends Node2D

func _ready() -> void:
	print("OLA MUNDO")
	pass
	
func _process(delta: float) -> void:
	queue_redraw()	
	
func _draw() -> void:
	
	draw_circle(
		Vector2(randi_range(0,1000), randi_range(0,500) ) ,     # get_global_mouse_position() ,    # Vector2( 250, 250) ,
		500,
		Color(0,255,0)
	)
