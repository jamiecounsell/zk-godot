class_name GamePlayer
extends Node

var id : String
var score = 0
var ball_on_bar = 1

func _init(identity : String):
	id = identity
	reset()

func reset():
	reset_ball_on_bar()
	reset_score()

func increase_score(points : int):
	print("Increasing player %s score by %d points" % [id, points])
	score += points

func decrease_score(points : int):
	print("Decreasing player %s score by %d points" % [id, points])
	score -= points

func reset_score():
	print("Resetting player %s score to 0 points" % id)
	score = 0

func sink(hole : int):
	print(("Player %s sunk hole %d" % [id, hole]))
	ball_on_bar += 1

func reset_ball_on_bar():
	ball_on_bar = 1
