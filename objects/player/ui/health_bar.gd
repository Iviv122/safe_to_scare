extends ProgressBar 
class_name HealthBar

func _ready():

    max_value = PlayerStatsInstance.health
    value = PlayerStatsInstance.health
    PlayerStatsInstance.updated.connect(update)

func update() -> void:
    value = PlayerStatsInstance.health