extends PointLight2D
class_name BlickingLight

@export var magnitude : float = 0.2

var init_scale : float 

var tween := create_tween()

func _ready():
	init_scale = texture_scale


func _process(_delta):
	texture_scale = init_scale+randf_range(-magnitude,magnitude)
	var r = randf_range(-0.1,0.1)
	global_position = get_parent().global_position + Vector2(r,r)
