extends Curse
class_name EnemyDeliveryCurse

func apply() -> void:
    PlayerStatsInstance.player_node.player_node.get_tree().current_scene.add_child(EnemyDeliver.new())