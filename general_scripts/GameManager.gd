extends Node

enum GameState{
	PLAYING,
	DIALOGUE,
	CUTSCENE,
	PAUSED
}

var state = GameState.PLAYING

func can_player_move():
	return state == GameState.PLAYING

func start_dialogue():
	state = GameState.DIALOGUE

func end_dialogue():
	state = GameState.PLAYING

func start_cutscene():
	state = GameState.CUTSCENE

func end_cutscene():
	state = GameState.PLAYING

func pause_game():
	state = GameState.PAUSED

func resume_game():
	state = GameState.PLAYING
