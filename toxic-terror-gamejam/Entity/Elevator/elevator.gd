extends StaticBody2D
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var marker_2d: Marker2D = $Marker2D
var animation: bool = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	pass
	
func _physics_process(_delta: float) -> void:
	if animation:
		print("true")
		player.global_position = marker_2d.global_position
	
func _on_interact() -> void:
	#based on the level data from GameManager choose ascend or descend
	player.cutscene = true
	start_descend()
	
func start_descend() -> void:
	animation_player.play("descend")
	animation = true
	await animation_player.animation_finished
	pass
	
	
func start_ascend() -> void:
	pass
