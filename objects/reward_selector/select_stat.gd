extends Button
class_name SelectStat

var stat : StatReward

func _pressed() -> void:
    PlayerStatsInstance.add_stats(stat)