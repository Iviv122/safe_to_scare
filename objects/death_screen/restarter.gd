extends Button
class_name  Restarter

func _pressed() -> void:
	
	get_tree().call_group("restart","restart")
	get_tree().reload_current_scene()
	GameStateInstance.set_state(GameState.State.Tutorial)
	Engine.time_scale = 1
