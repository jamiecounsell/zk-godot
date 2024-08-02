extends Node
class_name Game

@export var rounds : Array[Round]
@export var players : Array[Player]

var results : Array[Round] = []

func _ready():
	for game_round in rounds:
		await game_round.run()
		results.append(game_round)
		if game_round.game_over():
			AudioService.playOnce("res://Sounds/UI/Complete_02.ogg")

func get_score(player: Player):
	return 0
