extends Resource
class_name EnemyList 

var list : Array[PackedScene]

static func get_list() -> Array[PackedScene]:
	var items: Array[PackedScene]

	var path = 'res://assets/prefabs/enemies/'
	var dir = DirAccess.open(path)

	for i in dir.get_files():

		if not (i.ends_with(".tscn") or i.ends_with(".scn")):
			continue
		if i.ends_with(".tscn.remap") or i.ends_with(".scn.remap"):
			continue

		var file_path = path + i
		var loaded = load(file_path)
		items.append(loaded)

	print("enemies loaded")

	return items
