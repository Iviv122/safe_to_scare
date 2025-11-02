extends Sprite2D 
class_name HealTint 

var tween : Tween

func _ready():
	PlayerStatsInstance.healed.connect(heal)
	self_modulate.a = 0

func heal() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	self_modulate.a = 1
	tween.tween_property(self,'self_modulate:a',0,0.2)