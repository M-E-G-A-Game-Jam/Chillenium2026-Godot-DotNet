extends TextureButton
@onready var noramal_cloud_group = $"../../NormalCloudGroup"
@onready var storm_cloud_group = $"../../StormCloudGroup"
@onready var start_guy_group = $"../../StartGuyGroup"
@onready var start_button = $"../startButton"
@onready var end_button = $"../endButton"


@onready var start_sprite: AnimatedSprite2D = start_button.get_node("AnimatedSprite2D")
@onready var end_sprite: AnimatedSprite2D  = end_button.get_node("AnimatedSprite2D")
@onready var hover_sfx: AudioStreamPlayer = $hover_sfx
@onready var click_sfx: AudioStreamPlayer = $click_sfx
@onready var fade_rect: ColorRect = $"../../FadeinLayer/FadeReact"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	disabled = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE

	fade_rect.visible = true
	fade_rect.color = Color(0, 0, 0, 1)
	fade_rect.modulate = Color(1, 1, 1, 0)

	var tw := get_tree().create_tween()
	tw.tween_property(fade_rect, "modulate:a", 1.0, 0.2)

	click_sfx.play()
	await click_sfx.finished

	get_tree().change_scene_to_file("res://scenes/ingame_scene.tscn")

func _on_mouse_entered() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = true
	hover_sfx.play()
	start_sprite.pause()


func _on_mouse_exited() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false
	
	start_sprite.play()
	end_sprite.play()
