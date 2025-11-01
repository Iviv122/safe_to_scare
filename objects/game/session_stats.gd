extends Node
class_name SessionStats

var session_time = 0
var time = 0

var kills = 0
var waves = 0
var chests_opened = 0

func _process(delta) -> void:
    if GameStateInstance.state == GameState.State.Playing:
        time += delta
    session_time += delta