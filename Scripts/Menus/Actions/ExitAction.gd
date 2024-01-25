extends "res://Scripts/Menus/Actions/Action.gd"

@export var restart_after_exit : bool = false

func execute(_node):
	GameService.exit(restart_after_exit)

static func get_action_property_list() -> Array:
	return [
		{
			"name": "restart_after_exit", 
			"type": TYPE_BOOL, 
			"usage": PROPERTY_USAGE_DEFAULT, 
		}
	]
