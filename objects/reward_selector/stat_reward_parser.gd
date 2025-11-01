class_name StatRewardParser

static func load_stat_rewards_from_file(path: String = "res://assets/jsons/stat_rewards.json") -> Array[StatReward]:
	var stat_rewards: Array[StatReward] = []
	var file := FileAccess.open(path, FileAccess.READ)
	
	if file == null:
		assert(false,"No stat_reward_file")	

	var json_text := file.get_as_text()
	file.close()

	var result = JSON.parse_string(json_text)
	if typeof(result) != TYPE_DICTIONARY:
		assert(false,"Invalid stat reward file structure")

	if result.has("rewards"):
		for rewards in result["rewards"]:
			stat_rewards.append(StatReward.from_dict(rewards))

	return stat_rewards