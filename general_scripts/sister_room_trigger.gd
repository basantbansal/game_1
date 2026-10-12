extends Area3D

var triggered = false

func _on_body_entered(body):

	if triggered:
		return

	if body.name != "player2":
		return

	triggered = true

	var dialogue = get_tree().get_first_node_in_group("dialogue")

	dialogue.start_dialogue([
		["You", "Hey...?"],
		["You", "Why are you standing like that?"],
		["Sister", "..."],
		["You", "Are you okay?"]
	])
