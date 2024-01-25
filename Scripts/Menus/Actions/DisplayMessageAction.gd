extends "res://Scripts/Menus/Actions/Action.gd"

@export var message_box : NodePath

func getMessage():
	return "Not impemented"

func execute(node):
	if message_box:
		node.get_node(message_box).message = "hello world"

static func get_action_property_list() -> Array:
	return [
		{
			"name": "message_box", 
			"type": TYPE_NODE_PATH
		}
	]
