extends State
class_name IdleState


func Enter():
	#anim play idle
	pass

func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	print("idle")
	if direction != 0:
		Transitioned.emit(self, "walk")
