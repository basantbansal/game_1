extends Node

signal story_changed(new_state)

enum StoryState {
	INTRO,
	TALK_TO_MOM,
	MOM_GO_TO_KITCHEN,
	WASH_HANDS,
	DINNER,
	POWER_OUT
}

var state = StoryState.INTRO


func set_state(new_state):
	if state == new_state:
		return

	state = new_state

	print("Story -> ", StoryState.keys()[state])

	story_changed.emit(state)
