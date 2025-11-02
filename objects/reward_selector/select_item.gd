extends SelectCard 
class_name SelectItem 

var item : Item

func _pressed() -> void:
    item.pick_up(PlayerStatsInstance.player_node.player_node)