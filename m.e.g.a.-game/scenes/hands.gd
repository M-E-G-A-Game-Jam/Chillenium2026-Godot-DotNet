extends Sprite2D

@export var min_x := 800.0
@export var max_x := 1500.0
@export var min_y := 700.0
@export var max_y := 1650.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

func _process(delta):
	var mouse := get_global_mouse_position()
	
	var clamped_x = clamp(mouse.x,400, 1500)
	var clamped_y = clamp(mouse.y, 700, 1650)

	var clamped_pos = Vector2(clamped_x, clamped_y)

	# Move hand
	global_position = clamped_pos

	if mouse.distance_to(clamped_pos) > 0.5:
		get_viewport().warp_mouse(clamped_pos)
