extends Node

@onready var main_layer: TileMapLayer = $"../../Layers/MainLayer"
@onready var player: CharacterBody2D = $"../../Player"


@onready var interaction_area: InteractionArea = $InteractionArea
var interacting: bool = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	pass
	
func _physics_process(_delta: float) -> void:
	if interacting:
		main_layer.visible = false
		player.velocity = Vector2.ZERO
		player.visible = false

	
func _on_interact() -> void:
	interacting = true
	
	pass
