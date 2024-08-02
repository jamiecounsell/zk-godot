class_name Game
extends Node

func start():
	print("Starting game")
	for round in get_rounds():
		round.start()
		await round.round_ended

func get_rounds():
	return []
