extends State
class_name IdleRight

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func Enter():
	#anim play idle
	animation_player.play("idle1R")
	pass

func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	
	if direction < 0:
		Transitioned.emit(self, "walkleft")
		return
	elif direction > 0:
		Transitioned.emit(self, "walkright")
		return
	
	
