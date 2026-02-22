extends TextureButton
@onready var no_button = $"../NoButton"


@onready var no_sprite: AnimatedSprite2D  = no_button.get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_no_button_mouse_entered() -> void:
	no_button.pause()
