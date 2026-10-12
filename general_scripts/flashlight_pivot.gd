extends Node3D

@export var smooth_speed := 1

@onready var cam := get_parent() # Camera3D


func _process(delta):

	var target = cam.transform.basis

	transform.basis = transform.basis.slerp(
		target,
		smooth_speed * delta
	)
