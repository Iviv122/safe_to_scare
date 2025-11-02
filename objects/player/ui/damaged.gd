extends Sprite2D 
class_name DamageTint 

var tween : Tween

func _ready():
	PlayerStatsInstance.damaged.connect(damage)
	self_modulate.a = 0

func damage() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	self_modulate.a = 1
	tween.tween_property(self,'self_modulate:a',0,0.2)
