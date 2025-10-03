extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer


func _ready() -> void:
	animation_player.play("intro")

func play_video() -> void:
	video_stream_player.play()
