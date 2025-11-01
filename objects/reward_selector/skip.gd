extends Button
class_name SkipButton

@export var screen : SelectScreen

func _pressed() -> void:
    screen.skip()