extends "res://Scripts/Menus/Actions/Action.gd"

@export var target_path : NodePath

func execute(_node: Node):
	if target_path:
		var toggle = _node.get_node_or_null(target_path)
		toggle = toggle if toggle else _node.get_node(target_path)
		toggle.visible = !toggle.visible

static func get_action_property_list() -> Array:
	return [
		{
			"name": "target_path", 
			"type": TYPE_NODE_PATH, 
			"usage": PROPERTY_USAGE_DEFAULT, 
			"hint": PROPERTY_HINT_NODE_PATH_VALID_TYPES, 
			"hint_string": "Node2D,Control"
		}
	]
