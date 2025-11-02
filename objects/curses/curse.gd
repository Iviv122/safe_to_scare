extends Resource
class_name Curse

@export var desc : String

func apply() -> void:
    print("sample curse")

func _to_string() -> String:
    return desc