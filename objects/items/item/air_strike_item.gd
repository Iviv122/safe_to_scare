extends Item
class_name AirStrikeItem

func spawn(a : Node2D) -> void:
	print("Spawn air striker")
	a.get_tree().current_scene.add_child(AirStriker.new())

func pick_up(_self : Node2D) -> void:
	spawn(_self)

func _to_string() -> String:
	return "Air strikes every second"
