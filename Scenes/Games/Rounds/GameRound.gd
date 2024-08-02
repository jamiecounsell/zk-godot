#
# A Round that ends when any hole is sunk and 
# gives the player 1000 points.
#
class_name GameRound
extends Node

signal round_started
signal round_ended

@export var player : GamePlayer

func _init(player: GamePlayer):
	player = player

func start():
	round_started.emit()
	SensorService.ball_sensor_triggered.connect(_on_ball)

func _on_ball(_ball):
	player.increase_score(1000)
	round_ended.emit()
