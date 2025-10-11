extends CharacterBody2D

var running_speed: float = 200.0
var speed:float = 100.0
var max_stamina: float = 100.0
var stamina: float = max_stamina
var stamina_drain_rate: float = 100.0
var stamina_recovery_rate: float = 15.0
var can_run: bool = true

func _physics_process(delta: float) -> void:
	pass
