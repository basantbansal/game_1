extends Node3D

var opened = false
var locked = false 

@export var start_open := false

@export var open_sound : AudioStream
@export var close_sound : AudioStream

func _ready():
	if start_open:
		opened = true
		$AnimationPlayer.assigned_animation = "open"
		$AnimationPlayer.seek($AnimationPlayer.current_animation_length, true)

func toggle_door():
	if $AnimationPlayer.current_animation != "open" and !locked:

		opened = !opened

		if opened:
			$"hinge/DoorSound".stream = open_sound
			$"hinge/DoorSound".play()

			$AnimationPlayer.play("open")

		else:
			$"hinge/DoorSound".stream = close_sound
			$"hinge/DoorSound".play()

			$AnimationPlayer.play_backwards("open")
