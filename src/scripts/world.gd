# ==============================================================================
# Author: Enrique González Gutiérrez
# Date: 13/06/2026
# Description: Reusable dynamic level loader that imports platform coordinate
#              data from decoupled external JSON database files at runtime.
# ==============================================================================
extends Node2D

# Path to the active level database file (Exposed in the inspector)
@export_file("*.json") var level_database_path: String = "res://src/database/level_1.json"

func _ready() -> void:
	# Load and verify JSON level data from storage
	var level_data: Array = _load_level_from_json(level_database_path)
	
	if level_data.is_empty():
		printerr("CRITICAL: Failed to load level data from path: ", level_database_path)
		return
		
	# Iteratively spawn each platform registered in the database file
	for platform_dict in level_data:
		_spawn_platform_from_dictionary(platform_dict)

# Safe file parser returning an array of parsed dictionary properties
func _load_level_from_json(path: String) -> Array:
	if not FileAccess.file_exists(path):
		printerr("ERROR: Database file does not exist: ", path)
		return []
		
	var file := FileAccess.open(path, FileAccess.READ)
	if not file:
		printerr("ERROR: Could not open file: ", path)
		return []
		
	var json_string := file.get_as_text()
	var json := JSON.new()
	var error := json.parse(json_string)
	
	if error != OK:
		printerr("ERROR: JSON Parsing failed on line ", json.get_error_line(), ": ", json.get_error_message())
		return []
		
	if json.data is Array:
		return json.data
		
	return []

# Dynamic instantiation of platform nodes based on database dictionary keys
func _spawn_platform_from_dictionary(dict: Dictionary) -> void:
	# Extract properties with safety fallbacks
	var pos := Vector2(dict.get("x", 0.0), dict.get("y", 0.0))
	var size := Vector2(dict.get("w", 100.0), dict.get("h", 40.0))
	var color_code: String = dict.get("color", "#ffffff")
	
	# 1. Instantiate the physics static body
	var static_body := StaticBody2D.new()
	static_body.global_position = pos
	
	# 2. Instantiate and configure the visual rectangle
	var color_rect := ColorRect.new()
	color_rect.size = size
	color_rect.color = Color(color_code)
	color_rect.position = Vector2.ZERO
	
	# 3. Instantiate and configure the collision physics shape
	var collision_shape := CollisionShape2D.new()
	var rectangle_shape := RectangleShape2D.new()
	rectangle_shape.size = size
	collision_shape.shape = rectangle_shape
	collision_shape.position = size / 2.0
	
	# 4. Link nodes into hierarchy
	static_body.add_child(color_rect)
	static_body.add_child(collision_shape)
	
	# 5. Append the complete platform to the world scene
	add_child(static_body)
