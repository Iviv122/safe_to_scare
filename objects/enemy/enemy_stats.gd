class_name EnemyStats

@export var health : float = 8
@export var speed : float = 250

@export var contact_damage : float = 1 
@export var exp_death : float = 1

@export var size : float = 1

@export var color : Color = Color(96,79,255)

func duplicate() -> EnemyStats:
	var n = EnemyStats.new()

	n.health = health
	n.speed = speed
	n.contact_damage = contact_damage
	n.exp_death = exp_death
	n.size = size
	n.color = color

	return n

static func from_dict(data: Dictionary) -> EnemyStats:
	var stats : EnemyStats = EnemyStats.new()


	if data.has("health"): stats.health = data["health"]
	if data.has("speed"): stats.speed = data["speed"]
	if data.has("contact_damage"): stats.contact_damage = data["contact_damage"]
	if data.has("exp_death"): stats.exp_death = data["exp_death"]
	if data.has("size"): stats.size = data["size"]
	if data.has("color"): stats.color = Color.html(data["color"])

	return stats
