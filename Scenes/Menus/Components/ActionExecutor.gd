@tool
class_name ActionExecutor
extends Control

var button : Button = null
var runnable = null;

@export_file('*.gd') var action : String :
	set(new_action):
		action = new_action
		var loaded = load(action)
		runnable = loaded.new() if new_action and loaded else null
		if button and runnable:
			button.pressed.connect(_run_action)
		notify_property_list_changed()

func _set(property, value) -> bool:
	if runnable and property in runnable.get_action_property_list().map(func(x): return x.name):
		runnable.set(property, value)
		return true
	return false

func _get(property):
	if _child_should_handle(property):
		return runnable.get(property)

func _child_should_handle(property):
	return runnable and property in runnable.get_action_property_list().map(func(x): return x.name)

func _get_property_list() -> Array:
	var properties = []
	if runnable:
		properties = runnable.get_action_property_list()
	return properties if properties else []

func _ready():
	button = $Button
	if action and not runnable:
		runnable = load(action).new()
	if action:
		button.pressed.connect(_run_action)

func _run_action():
	runnable.execute(self)
