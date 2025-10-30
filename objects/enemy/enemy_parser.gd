class_name EnemyParser

static func load_enemies_from_file(path: String = "res://assets/jsons/enemies.json") -> Array[EnemyStats]:
	var enemies: Array[EnemyStats] = []
	var file := FileAccess.open(path, FileAccess.READ)
	
	if file == null:
		push_error("Failed to open enemies file: %s" % path)
		return enemies

	var json_text := file.get_as_text()
	file.close()

	var result = JSON.parse_string(json_text)
	if typeof(result) != TYPE_DICTIONARY:
		push_error("Invalid JSON structure in %s" % path)
		return enemies

	if result.has("enemies"):
		for enemy_data in result["enemies"]:
			var stats := EnemyStats.from_dict(enemy_data)
			enemies.append(stats)

	return enemies
