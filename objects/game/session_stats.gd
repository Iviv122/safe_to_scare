extends Node
class_name SessionStats

var time = 0

var kills = 0
var waves = 0
var chests_opened = 0

func _process(delta) -> void:
    time += delta