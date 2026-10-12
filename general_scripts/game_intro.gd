extends Node3D

func _ready():
	$"../NightAmbience".play()
	$FireCrackle.play()

	$cutscene_cam.current = true
	$AnimationPlayer.play("intro")

	await $AnimationPlayer.animation_finished

	$"../DialogueUI".start_dialogue([
	["Mom","Welcome home."],
	["You","I'm back."],
	["Mom","Dinner is ready."],
	["You","Coming. BTW where is my sister ?"],
	["Mom","The usual , you know it... her room"],
	["You","Ok lemme check on her."]
])

	$FireCrackle.stop()

	$cutscene_cam.current = false
	$"../player2/head/Camera3D".current = true

	queue_free()
