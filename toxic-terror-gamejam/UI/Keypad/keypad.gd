extends Control

@onready var display: Label = $Display
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var key_pad: StaticBody2D = $"../../../Objects/KeyPad"

var code: String = ""
var blocked: bool = false;
const RESET_TIME = 0.3


func _process(_delta: float) -> void:
	if len(code) == 4:
		if code == GameManager.BUNKER_CODE:
			await get_tree().create_timer(0.5).timeout
			key_pad.interacting = false

		blocked = true
		await get_tree().create_timer(RESET_TIME).timeout
		blocked = false
		code = ""
		display.text = ""

func add_digit(digit: String) -> void:
	code += str(digit)
	display.text = code
	
func play_animation(digit: String) -> void:
	if blocked:
		return
	add_digit(digit)
	animation_player.play(digit)
	await await get_tree().create_timer(0.17).timeout
	animation_player.play("idle")
	

func _on_button_7_pressed() -> void:
	play_animation("7")

func _on_button_8_pressed() -> void:
	play_animation("8")

func _on_button_9_pressed() -> void:
	play_animation("9")

func _on_button_4_pressed() -> void:
	play_animation("4")

func _on_button_5_pressed() -> void:
	play_animation("5")

func _on_button_6_pressed() -> void:
	play_animation("6")

func _on_button_1_pressed() -> void:
	play_animation("1")

func _on_button_2_pressed() -> void:
	play_animation("2")

func _on_button_3_pressed() -> void:
	play_animation("3")
