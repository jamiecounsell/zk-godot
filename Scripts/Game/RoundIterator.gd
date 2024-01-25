extends Node
class_name RoundIterator

var current_round : Round
var game : Game

func _init(game: Game):
	game = game

func should_continue():
	return current_round.round_number > 3

func _iter_init(arg):
	return should_continue()

func _iter_next(arg):
	var new_round = Round.new(game.players)
	new_round.round_number = current_round.round_number if current_round else 0
	return new_round

func _iter_get(arg):
	return current_round
