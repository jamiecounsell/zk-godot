extends Node

# Networking
var client = PacketPeerUDP.new()
const host = "127.0.0.1"
const port = 12345
const UPDATES_PER_SEC = 0
var timer =  Timer.new()
var seq = 0

# Motors
enum Motor { LEFT, RIGHT }
const SPEED = 50

@export var motors = {
	Motor.LEFT: 0,
	Motor.RIGHT: 0,
}

func _ready():
	motors[Motor.LEFT] = 0
	motors[Motor.RIGHT] = 0
	
	# Connect to daemon
	_connect()
	
	timer.wait_time = 1.0 / UPDATES_PER_SEC
	timer.timeout.connect(_update_daemon)
	add_child(timer)
	timer.start()

func _physics_process(delta):
	# Left Motor
	if Input.is_action_pressed("left_stick_up"):
		up(Motor.LEFT)
	elif Input.is_action_pressed("left_stick_down"):
		down(Motor.LEFT)
	else:
		stop(Motor.LEFT)
	
	if Input.is_action_pressed("right_stick_up"):
		up(Motor.RIGHT)
	elif Input.is_action_pressed("right_stick_down"):
		down(Motor.RIGHT)
	else:
		stop(Motor.RIGHT)
	
func set_motor(direction: int, speed: float):
	motors[direction] = speed * SPEED

func up(direction: int):
	set_motor(direction, 1)

func down(direction: int):
	set_motor(direction, -1)

func stop(direction: int):
	set_motor(direction, 0)

func _connect():
	if client.connect_to_host(host, port) == OK:
		print("Listening for UDP datagrams on port: ", port)
	else:
		print("Failed to start UDP client.")
		
	call_deferred("set_process", false)  # Stop processing if needed

func _update_daemon():
	seq = seq + 1
	var data = JSON.stringify({
		"seq": seq,
		"left": motors[Motor.LEFT],
		"right": motors[Motor.RIGHT]
	})
	_send_data(data)

func _send_data(data: String):
	var error = client.put_packet(data.to_utf8_buffer())
	if error != OK:
		push_error("Error sending UDP packet: ", error)
