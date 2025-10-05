extends State
class_name IdleLeft

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
var rng = RandomNumberGenerator.new()

func Enter():
	#anim play idle
	var num = rng.randi_range(1, 2)
	if num == 1:
		animation_player.play("idle1L")
	else:
		animation_player.play("idle2L")
	pass

func Physics_Update(_delta: float):
	var direction = Input.get_axis("left", "right")
	
	if direction < 0:
		Transitioned.emit(self, "walkleft")
		return
	elif direction > 0:
		Transitioned.emit(self, "walkright")
		return
	
