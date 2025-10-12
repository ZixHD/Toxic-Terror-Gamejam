extends State
class_name Walk

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	print("sao u walk")
	_update_animation()

func _update_animation():
	if player.last_facing_direction == "right":
		animation_player.play("walkR")
	else:
		animation_player.play("walkL")
	pass
	
func Physics_Update(_delta: float):
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	var running_flag = Input.is_action_pressed("run")
	
	
	if direction_x < 0:
		player.last_facing_direction = "left"
	elif direction_x > 0:
		player.last_facing_direction = "right"
		
	if player.stamina >= player.max_stamina * 0.25:
		player.can_run = true

	
	if direction_x == 0 and direction_y == 0:
		Transitioned.emit(self, "idle")
		return
		
	if player.can_run:
		if running_flag and direction_x != 0:
			Transitioned.emit(self, "running")
	
	player.stamina += player.stamina_recovery_rate * _delta
	player.stamina = min(player.stamina, player.max_stamina)
	player.velocity.x = direction_x * player.speed
	player.velocity.y = direction_y * player.speed
	
	player.move_and_slide()
	_update_animation()
	
