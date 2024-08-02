extends Node

@export var menu : Control
@export var game : Script
@onready var target_overlay = get_node_or_null("TargetOverlay")

var players : Array[GamePlayer] = []

func _ready():
	players = [GamePlayer.new("player")]
	if target_overlay and target_overlay.visible:
		toggle_target_overlay()
	if not game:
		push_warning("No game script specified")
	if game.can_instantiate():
		var running = game.new(self, players)
		running.start()

func _input(event):
	if event.is_action_pressed("ui_cancel") and menu:
		menu.visible = !menu.visible
		get_tree().get_root().set_input_as_handled()
	if event.is_action_pressed("debug"):
		toggle_target_overlay()

func toggle_target_overlay():
	if target_overlay:
		target_overlay.visible = !target_overlay.visible
	else:
		push_warning("No target overlay set for game mode")
