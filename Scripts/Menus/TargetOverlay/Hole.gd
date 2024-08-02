extends Control

var default_font = ThemeDB.fallback_font
var default_font_size = ThemeDB.fallback_font_size
var regex = RegEx.new()

var number

@export var circle_radius = 10
@export var font_size = default_font_size

func _ready():
	regex.compile("Hole(\\d+)$")
	font_size = font_size or default_font_size
	var result = regex.search(name)
	if result:
		number = int(result.get_string())

func _draw():
	draw_circle(Vector2.ZERO, circle_radius, Color.WHITE)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if event.position.distance_to(position) <= circle_radius:
			print("Hole " + str(number) + " was triggered")
			SensorService.ball_sensor_triggered.emit(number)
