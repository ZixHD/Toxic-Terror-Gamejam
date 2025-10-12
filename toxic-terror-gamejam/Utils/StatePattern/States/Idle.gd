extends State
class_name Idle

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
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	
	_change_state(direction_x, direction_y)
	
	
	if player.stamina >= player.max_stamina * 0.25:
		player.can_run = true
	
	player.stamina += player.stamina_recovery_rate * _delta
	player.stamina = min(player.stamina, player.max_stamina)	
	
func _change_state(direction_x, direction_y):
	if direction_x != 0 or direction_y != 0:
		Transitioned.emit(self, "walk")
		return
	if player.cutscene:
		Transitioned.emit(self, "cutscene")
		return
	
