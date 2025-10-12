extends State
class_name Cutscene

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var rng = RandomNumberGenerator.new()

func Enter():
	print("idle")
	_update_animation()
	
func _update_animation():
	var num = rng.randi_range(1, 2)
	if player.last_facing_direction == "left":
		if num == 1:
			animation_player.play("idle1L")
		else:
			animation_player.play("idle2L")
		pass
	else:
		if num == 1:
			animation_player.play("idle1R")
		else:
			animation_player.play("idle2R")
		pass
	
func Physics_Update(_delta: float):
	
	player.velocity = Vector2.ZERO
	if player.cutscene == false and Engine.time_scale == 1:
		Transitioned.emit(self, "idle")
	
