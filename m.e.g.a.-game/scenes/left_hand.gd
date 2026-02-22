extends Sprite2D

@export var min_x := 800.0
@export var max_x := 1500.0
@export var min_y := 400.0
@export var max_y := 650.0

func _process(delta):
	var mouse := get_global_mouse_position()

	mouse.x = clamp(mouse.x, min_x, max_x)
	mouse.y = clamp(mouse.y, min_y, max_y)

	global_position = mouse		
