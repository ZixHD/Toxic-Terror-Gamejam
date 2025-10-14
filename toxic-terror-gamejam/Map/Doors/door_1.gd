extends Area2D

@onready var main_layer: TileMapLayer = $"../../Layers/MainLayer"
@onready var side_room_1: Area2D = $"../../Layers/SideRooms/SideRoom1"

var room_entered: bool = false

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var tween = create_tween()
		side_room_1.visible = true
		tween.tween_property(main_layer, "modulate:a", 0.2, 0.1)


		

func _on_body_exited(body: Node2D) -> void:
		side_room_1.visible = false
		if body.is_in_group("Player"):
			var tween = create_tween()
			if not room_entered:
				tween.tween_property(main_layer, "modulate:a", 1.0, 0.1)
				pass
			else:
				tween.tween_property(main_layer, "modulate:a", 0.2, 0.1)
				pass
				
			
			


func _on_side_room_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		room_entered = true
	pass # Replace with function body.


func _on_side_room_1_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		room_entered = false
	pass # Replace with function body.
