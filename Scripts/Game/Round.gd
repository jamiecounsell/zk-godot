extends Node
class_name Round

@export var round_number = 0
var players : Array[Player]

signal ended

func _init(players: Array[Player]):
	players = players

func game_over():
	return false

func run():
	return await ended
