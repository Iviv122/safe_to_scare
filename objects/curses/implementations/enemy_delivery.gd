extends Sprite2D
class_name EnemyDelivery

@export var explode_effect: PackedScene
@export var spawner: EnemySpawnerNode

var time = 1
var init_scale: Vector2

func _ready():
	init_scale = scale
	
func proc() -> void:
	var angle = 1.04719755
	for i in range(0, 3):
		spawner.node.spawn_pos(global_position + (Vector2.RIGHT * 55).rotated(angle * i))

	var ef: GPUParticles2D = explode_effect.instantiate()
	ef.global_position = global_position
	ef.restart()
	get_tree().current_scene.add_child(ef)


	queue_free()
	pass

func _process(delta: float):
	if GameStateInstance.state == GameState.State.Selecting:
		return

	scale = init_scale * time
	time -= delta

	if time <= 0:
		proc()
