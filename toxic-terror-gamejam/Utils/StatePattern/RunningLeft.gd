extends State
class_name RunningLeft

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func Enter():

	animation_player.play("walkL")
	pass
	
func Physics_Update(_delta: float):
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	
	if direction_x == 0:
		Transitioned.emit(self, "idleleft")
		return
	if player.stamina <= 0:
		player.can_run = false
		Transitioned.emit(self, "walkleft")
		return
		
	player.stamina -= player.stamina_drain_rate * _delta
	player.stamina = max(player.stamina, 0)
	
	player.velocity.x = direction_x * player.running_speed
	player.velocity.y = direction_y * player.running_speed
	player.move_and_slide()
	
