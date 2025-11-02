extends Resource
class_name ItemsList

@export var list: Array[Item]


static func get_list() -> Array[Item]:
    var items: Array[Item]

    var path = 'res://assets/items/'
    var dir = DirAccess.open(path)

    for i in dir.get_files():
        var file_path = path + i
        var loaded = load(file_path)
        items.append(loaded)

    return items