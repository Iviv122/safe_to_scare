extends LightOccluder2D
class_name CircleOcluder

@export var radius : float = 32

func _ready():
	
	var oc = OccluderPolygon2D.new()
	oc.polygon = generate_circle_polygon(12)

	oc.cull_mode = OccluderPolygon2D.CULL_CLOCKWISE

	occluder = oc

func generate_circle_polygon(num_sides: int) -> PackedVector2Array:
	var angle_delta: float = (PI * 2) / num_sides
	var vector: Vector2 = Vector2(radius, 0)
	var polygon: PackedVector2Array 

	for _i in num_sides:
		polygon.append(vector + Vector2.ZERO)
		vector = vector.rotated(angle_delta)

	return polygon