extends State
class_name WalkRight

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	animation_player.play("walkR")
	pass
	
func Physics_Update(_delta: float):
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	var running_flag = Input.is_action_pressed("run")
	
	if player.stamina >= player.max_stamina * 0.25:
		player.can_run = true
	print("ov")
	if direction_x == 0:
		Transitioned.emit(self, "idleright")
		return
	if direction_x < 0:
		Transitioned.emit(self, "walkleft")
		return
	
	if player.can_run:
		if running_flag and direction_x < 0:
			Transitioned.emit(self, "runningleft")
		elif running_flag and direction_x > 0:
			Transitioned.emit(self, "runningright")
		
	player.stamina += player.stamina_recovery_rate * _delta
	player.stamina = min(player.stamina, player.max_stamina)
	player.velocity.x = direction_x * player.speed
	player.velocity.y = direction_y * player.speed
	player.move_and_slide()
	
