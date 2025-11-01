extends RichTextLabel 
class_name TutorialLabel

@export var instructions : Array[TutorialBlock]

var i = 0

func _ready():
	for j in instructions:
		j.updated.connect(update)
		j.all_done.connect(next)
	update()

func end_tutor() -> void:
	pass

func next() -> void:
	i += 1
	if i >= instructions.size():
		queue_free()

func update() -> void:
	if i < instructions.size():
		text = instructions[i]._to_string()

func _input(event):
	if i < instructions.size():
		instructions[i]._input(event)
