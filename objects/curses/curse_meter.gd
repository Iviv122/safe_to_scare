extends ProgressBar
class_name CurseMeter

@export var select_screen : SelectScreen

var time = 0

func _ready():
	max_value = 15
	min_value = 0

func _process(delta: float) -> void:

	if GameStateInstance.state != GameState.State.Playing:
		return

	time += delta 
	value = time
	if value >= max_value:
		time = 0
		max_value *= 1.5
		select_screen.curse_reward()
