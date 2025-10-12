extends State
class_name Cutscene

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


	
func Physics_Update(_delta: float):
	
	player.velocity = Vector2.ZERO
	if player.cutscene == false:
		Transitioned.emit(self, "idle")
	
