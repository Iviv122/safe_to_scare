extends Resource 
class_name StatReward

@export var speed : float 
@export var max_health : float 
@export var damage: float
@export var reload_speed : float



static func from_dict(data: Dictionary) -> StatReward:
	var stats : StatReward = StatReward.new()


	if data.has("max_health"): stats.max_health = data["max_health"]
	if data.has("speed"): stats.speed = data["speed"]
	if data.has("damage"): stats.damage = data["damage"]
	if data.has("reload_speed"): stats.reload_speed = data["reload_speed"]

	return stats

func _to_string() -> String:
	var ans = ""

	if max_health != 0 : ans += "Max Health +" + str(max_health)+ "\n"
	if speed != 0 : ans += "Speed +" + str(speed)+ "\n"
	if damage != 0 : ans += "Damage +" + str(damage)+ "\n"
	if reload_speed != 0 : ans += "Reload Speed +" + str(reload_speed)+ "\n"

	return ans
