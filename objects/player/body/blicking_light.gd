extends PointLight2D
class_name BlickingLight

@export var speed : float = 0.1
@export var magnitude : float = 0.2

var init_scale : float 

var tween := create_tween()

func _ready():
    init_scale = texture_scale
    jump()


func jump() -> void:
    if tween:
        tween.kill()
    tween = create_tween()
    tween.tween_property(self,"texture_scale",init_scale+randf_range(-magnitude,magnitude),speed).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
    await get_tree().create_timer(speed).timeout
    jump()
