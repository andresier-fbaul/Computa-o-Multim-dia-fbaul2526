extends Node2D

#func _ready() -> void:
func _ready():
	print("OLA MUNDO. OLA TURMA!")
	#
#func _process(delta: float) -> void:
	#queue_redraw()


func _draw() -> void:
	
	draw_circle(
		Vector2( randi_range(0, 1000) , randi_range(0,600)  ), #get_global_mouse_position() ,   #Vector2( 250, 200),
		150,
		Color(123,55,255)
	)
