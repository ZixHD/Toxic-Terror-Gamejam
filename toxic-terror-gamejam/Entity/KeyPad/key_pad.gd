extends Node

@onready var main_layer: TileMapLayer = $"../../Layers/MainLayer"
@onready var player: CharacterBody2D = $"../../Player"
@onready var key_pad: CanvasLayer = $"../../CanvasLayer"



@onready var interaction_area: InteractionArea = $InteractionArea
var interacting: bool = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	pass
	
func _physics_process(_delta: float) -> void:
	if interacting:
		main_layer.visible = false
		key_pad.visible = true
		player.cutscene = true
		player.visible = false
	else:
		main_layer.visible = true
		key_pad.visible = false
		player.cutscene = false
		player.visible = true

	
func _on_interact() -> void:
	interacting = true
	pass
