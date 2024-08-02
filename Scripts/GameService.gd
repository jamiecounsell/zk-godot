extends Node

signal scene_changed
const default_scene = 'res://Scenes/Menus/MainMenu.tscn'
@onready var root = get_node('/root/Game/RenderRoot/GameViewport')
@onready var current_scene = root.find_child('MainMenu')

func _ready():
	scene_changed.connect(change_scene)
	
	var timer = Timer.new()
	timer.wait_time = 10
	timer.one_shot = true
	#timer.timeout.connect(func(): AudioService.play('uid://chdp0gnknt01b'))
	add_child(timer)
	timer.start()
	
func _process(_delta):
	if not current_scene:
		change_scene(default_scene)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		change_scene(default_scene)

func change_scene(path):
	if current_scene:
		current_scene.queue_free()

	var new_scene = load(path).instantiate()
	root.add_child(new_scene)
	current_scene = new_scene

func exit(restart = false):
	OS.set_restart_on_exit(restart)
	get_tree().quit()
