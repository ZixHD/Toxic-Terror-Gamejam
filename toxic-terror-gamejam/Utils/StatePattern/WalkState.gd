extends State
class_name WalkState

@onready var player = get_tree().get_first_node_in_group("Player")

func Enter():
	pass
	
func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	
	if direction == 0:
		Transitioned.emit(self, "idle")
		return
	
	player.velocity.x = direction * player.speed
	player.move_and_slide()
	
