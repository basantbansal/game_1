extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pause_menu.visible = false
	# set_task(null , "Enter the house")

func resume_game():
	get_tree().paused = false
	$pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func quit_game():
	get_tree().quit()

func set_task(body , task_text:String):
	if body == null || body != null and body.name == "player":
		$task_ui/task_text.text= task_text

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		$pause_menu.visible = !$pause_menu.visible
		get_tree().paused = $pause_menu.visible
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if !get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_resume_pressed() -> void:
	pass # Replace with function body.
