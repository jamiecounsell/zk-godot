extends Resource
class_name Action

# Called when the node enters the scene tree for the first time.
func execute(node):
	push_error('All Actions must implement execute()')

static func get_action_property_list() -> Array:
	return []
