extends Node3D

@onready var anim = $AnimationPlayer

@export var kitchen_target: Marker3D

func _ready():
	anim.play("idle_1")

func go_to_kitchen():
	global_position = kitchen_target.global_position
	anim.play("idle_1")
