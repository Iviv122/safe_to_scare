extends Resource
class_name ItemsList

@export var list: Array[Item]

var queue : Array[Item]

func _init():
	list = get_list()


func shuffle() -> void:
	queue.clear()
	for i in list:
		queue.append(i)
	queue.shuffle()


func get_item() -> Item:
	if queue.size() == 0 || list.size()-queue.size() >= 3:
		shuffle()
	
	return queue.pop_back()


static func get_list() -> Array[Item]:
	var items: Array[Item]

	var path = 'res://assets/items/'
	var dir = DirAccess.open(path)


	for i in dir.get_files():
		var file_path = path + i

		if (file_path.get_extension() == "remap"):
			file_path = file_path.replace('.remap', '')

		var loaded = load(file_path)
		items.append(loaded)

	return items