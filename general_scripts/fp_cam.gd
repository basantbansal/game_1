extends Node3D

var sensitivity = 0.2




func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print(GameManager.state)

func _input(event: InputEvent) -> void:
	if !GameManager.can_player_move():
		return

	if event is InputEventMouseMotion:
		get_parent().rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
