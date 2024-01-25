extends "res://Scripts/Menus/Actions/Action.gd"

@export var scene_path:String
@export var sound:String

func execute(_node):
	AudioService.playOnce(sound)
	GameService.change_scene(scene_path)

static func get_action_property_list() -> Array:
	return [
		{
			"name": "scene_path", 
			"type": TYPE_STRING, 
			"usage": PROPERTY_USAGE_DEFAULT, 
			"hint": PROPERTY_HINT_FILE, 
			"hint_string": "*.tscn"
		},
		{
			"name": "sound", 
			"type": TYPE_STRING, 
			"usage": PROPERTY_USAGE_DEFAULT, 
			"hint": PROPERTY_HINT_FILE, 
			"hint_string": "*.ogg"
		}
	]
