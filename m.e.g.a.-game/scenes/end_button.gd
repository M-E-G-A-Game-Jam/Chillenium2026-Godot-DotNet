extends TextureButton

@onready var noramal_cloud_group = $"../../NormalCloudGroup"
@onready var storm_cloud_group = $"../../StormCloudGroup"
@onready var start_guy_group = $"../../StartGuyGroup"
@onready var exit_guy_group = $"../../ExitGuyGroup"
@onready var start_button = $"../startButton"
@onready var end_button = $"../endButton"
@onready var hoverend_sfx: AudioStreamPlayer = $hoverend_sfx

@onready var start_sprite: AnimatedSprite2D = start_button.get_node("AnimatedSprite2D")
@onready var end_sprite: AnimatedSprite2D  = end_button.get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false
	exit_guy_group.visible = false
	
func _on_pressed() -> void:
		get_tree().quit()


func _on_mouse_entered() -> void:
	storm_cloud_group.visible = true
	noramal_cloud_group.visible = false
	start_guy_group.visible = false
	exit_guy_group.visible = true
	hoverend_sfx.play()
	end_sprite.pause()

func _on_mouse_exited() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false
	exit_guy_group.visible = false
	start_sprite.play()
	end_sprite.play()
