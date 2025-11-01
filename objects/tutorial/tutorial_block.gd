extends Resource
class_name TutorialBlock

@export var list: Array[InputEventAction]
var list_done: Array[bool]

var left: int = 0

signal all_done()
signal updated()

func have_list() -> void:
	if list_done.size() == 0:
			left = list.size()
			for i in list:
				list_done.append(false)

func _input(_event):
	have_list()

	for i in range(0, list.size()):
		if _event.is_action_pressed(list[i].action):
			
			if !list_done[i]:
				left -= 1
				list_done[i] = true
				print(left)
				if left <= 0:
					all_done.emit()
					print("All down")
			
			updated.emit()

func _to_string() -> String:
	have_list()
	var ans = ""
	for i in range(0, list.size()):
		if list_done[i]:
			ans += "[s]" + "Press: " + list[i].action + "[/s]" + "\n"
		else:
			ans += "Press: " + list[i].action + "\n"

	return ans
