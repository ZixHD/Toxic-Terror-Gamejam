extends State
class_name WalkRight

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	animation_player.play("walkR")
	pass
	
func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("up", "down")
	
	if direction == 0:
		Transitioned.emit(self, "idleright")
		return
	if direction < 0:
		Transitioned.emit(self, "walkL")
		return
	
	player.velocity.x = direction * player.speed
	player.velocity.y = direction_y * player.speed
	player.move_and_slide()
	
