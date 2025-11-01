extends Sprite2D
class_name Projectile

@export var radius : float
@export var speed : float
@export var damage_modifier : float

var dir : Vector2
var result : Array[Dictionary]


func on_spawn() -> void:
	pass
# delta is counted in already
func move() -> void:
	pass
func on_collide() -> void:
	pass



# don't modify in child
func _ready() -> void:
	on_spawn()
# don't modify in child
func check() -> void:
	var space_state = get_world_2d().direct_space_state

	var circle_shape = CircleShape2D.new()
	circle_shape.radius = radius 

	transform.origin = global_position 

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = circle_shape
	query.transform = transform
	query.collide_with_areas = true 

	result = space_state.intersect_shape(query) 

	if result.size() > 0:
		on_collide()
# don't modify in child, physics for slower update
func _physics_process(_delta):
	if GameStateInstance.state == GameState.State.Selecting:
		return	

	check()
	move()
