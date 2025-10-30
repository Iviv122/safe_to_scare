extends ProgressBar 
class_name ExpBar 

func _ready():

    max_value = PlayerStatsInstance.expirience_req
    value = PlayerStatsInstance.expirience
    PlayerStatsInstance.updated.connect(update)
    PlayerStatsInstance.lvl_up.connect(lvl_up)

func lvl_up() -> void:
    max_value = PlayerStatsInstance.expirience_req

func update() -> void:
    value = PlayerStatsInstance.expirience