extends Node

signal ball_sensor_triggered(ball_number)

var thread = Thread.new()
var latest_signal_data = null

func _ready():
	thread.start(read_sensor_thread)
	#ball_sensor_triggered.connect(func(t): print('hole ' + str(t) + ' triggered'))

func read_sensor_thread():
	while true:
		# data reading logic here (file or socket)
		var data = '{
			"hole": [1, 2]
		}'
		call_deferred("_signal_sensor_results", data)
		OS.delay_msec(10)  # Adjust based on your update frequency

func _signal_sensor_results(data):
	latest_signal_data = JSON.parse_string(data)
	if latest_signal_data == null:
		push_warning("Null result from sensor, could not parse: " + data)
	else:
		for hole in latest_signal_data['hole']:
			ball_sensor_triggered.emit(hole)
