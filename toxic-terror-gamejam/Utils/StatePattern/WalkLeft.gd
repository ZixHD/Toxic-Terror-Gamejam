extends State
class_name WalkLeft

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	print("usao walk lefta")
	animation_player.play("walkL")
	pass
	
func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	
	if direction == 0:
		Transitioned.emit(self, "idleleft")
		return
	if direction > 0:
		Transitioned.emit(self, "walkR")
		return
	player.velocity.x = direction * player.speed
	player.move_and_slide()
	
