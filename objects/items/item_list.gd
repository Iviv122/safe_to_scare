extends Resource
class_name ItemsList

@export var list: Array[Item]


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