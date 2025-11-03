extends CanvasLayer
class_name DeathLayer

func _ready():
    hide()
    PlayerStatsInstance.died.connect(appear)

func appear() -> void:
    show()
    Engine.time_scale = 0