extends State
class_name WalkLeft

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	print("usao walk lefta")
	animation_player.play("walkL")
	pass
	
func Physics_Update(_delta: float):
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	
	if direction_x == 0:
		Transitioned.emit(self, "idleleft")
		return
	if direction_x > 0:
		Transitioned.emit(self, "walkR")
		return
	player.velocity.x = direction_x * player.speed
	player.velocity.y = direction_y * player.speed
	player.move_and_slide()
	
