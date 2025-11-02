extends ProgressBar 
class_name HealthBar

func _ready():

    max_value = PlayerStatsInstance.max_health
    value = PlayerStatsInstance.health
    PlayerStatsInstance.updated.connect(update)

func update() -> void:
    max_value = PlayerStatsInstance.max_health
    value = PlayerStatsInstance.health