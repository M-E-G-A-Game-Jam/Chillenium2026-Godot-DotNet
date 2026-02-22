extends TextureButton
@onready var noramal_cloud_group = $"../../NormalCloudGroup"
@onready var storm_cloud_group = $"../../StormCloudGroup"
@onready var start_guy_group = $"../../StartGuyGroup"
@onready var start_button = $"../startButton"
@onready var end_button = $"../endButton"

@onready var start_sprite: AnimatedSprite2D = start_button.get_node("AnimatedSprite2D")
@onready var end_sprite: AnimatedSprite2D  = end_button.get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
		get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_mouse_entered() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = true
	
	start_sprite.pause()


func _on_mouse_exited() -> void:
	storm_cloud_group.visible = false
	noramal_cloud_group.visible = true
	start_guy_group.visible = false
	
	start_sprite.play()
	end_sprite.play()
