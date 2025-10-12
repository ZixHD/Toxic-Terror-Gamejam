extends Area2D

@onready var tile_map_layer: TileMapLayer = $"../../TileMapLayer"


func _ready() -> void:
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("usao")
		var tween = create_tween()
		tween.tween_property(tile_map_layer, "modulate:a", 0.2, 0.1)
		

func _on_body_exited(body: Node2D) -> void:
		if body.is_in_group("Player"):
			var tween = create_tween()
			tween.tween_property(tile_map_layer, "modulate:a", 1.0, 0.1)
