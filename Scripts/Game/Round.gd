extends Node
class_name Round

@export var round_number = 0
var players : Array[GamePlayer]

signal ended

func _init(players: Array[GamePlayer]):
	players = players

func round_over():
	return false

func run():
	return await ended
