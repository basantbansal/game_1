extends CanvasLayer

@onready var box = $DialogueBox
@onready var name_label = $DialogueBox/NameLabel
@onready var dialogue_label = $DialogueBox/DialogueText
@onready var continue_label = $DialogueBox/ContinueLabel
@onready var voice = $VoicePlayer

var character_voices = {
	"Mom": preload("res://sounds/women2.wav"),
	"You": preload("res://sounds/boy1.wav")
}

var dialogue = []
var current_index = 0
var talking = false

var typing = false
var full_text = ""
var typing_speed = 0.07


func _ready():
	box.visible = false


func start_dialogue(lines:Array):
	GameManager.start_dialogue()
	StoryManager.set_state(
	StoryManager.StoryState.TALK_TO_MOM
	)
	dialogue = lines
	current_index = 0

	box.visible = true
	talking = true

	show_current_line()


func show_current_line():

	name_label.text = dialogue[current_index][0]
	voice.stream = character_voices.get(name_label.text)
	
	full_text = dialogue[current_index][1]

	dialogue_label.text = ""

	continue_label.visible = false

	type_text()
	
func type_text():

	typing = true

	for letter in full_text:
		if !typing:
			break

		dialogue_label.text += letter
		if letter != " ":
			voice.pitch_scale = randf_range(0.92, 1.00 )
			voice.play()
		await get_tree().create_timer(typing_speed).timeout
	dialogue_label.text = full_text  
	typing = false

	continue_label.visible = true


func _input(event):

	if typing:

		typing = false

		dialogue_label.text = full_text

		continue_label.visible = true

		return

	if event.is_action_pressed("interact"):
		
		if typing:
			return
		current_index += 1

		if current_index >= dialogue.size():

			end_dialogue()

		else:

			show_current_line()


func end_dialogue():
	GameManager.end_dialogue()
	StoryManager.set_state(
	StoryManager.StoryState.MOM_GO_TO_KITCHEN
	)
	var mom = get_tree().current_scene.find_child("mom", true, false)
	if mom:
		mom.go_to_kitchen()
	box.visible = false
	talking = false
