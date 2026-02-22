extends Sprite2D

@export var min_x := 700.0
@export var max_x := 1500.0
@export var min_y := 700.0
@export var max_y := 1650.0

var free_mode := false  

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

func _process(delta):

	# Toggle on right click
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		pass

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		pass

	if Input.is_action_just_pressed("ui_right_click"):
		free_mode = !free_mode

	var mouse := get_global_mouse_position()

	if free_mode:
		# FREE MODE
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		global_position = mouse
	else:
		# CLAMP MODE
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

		var clamped_x = clamp(mouse.x, min_x, max_x)
		var clamped_y = clamp(mouse.y, min_y, max_y)
		var clamped_pos = Vector2(clamped_x, clamped_y)

		global_position = clamped_pos

		if mouse.distance_to(clamped_pos) > 0.5:
			get_viewport().warp_mouse(clamped_pos)
