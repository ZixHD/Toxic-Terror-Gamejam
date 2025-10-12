extends Node2D

@onready var settings: Control = $Settings


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Engine.time_scale = 0
		settings.visible = true;

		get_tree().root.get_viewport().set_input_as_handled()
