extends SpotLight3D

func _process(_delta):

	if Input.is_action_just_pressed("flashlight"):

		if GameManager.can_player_move():

			$sound.play()

			visible = !visible
