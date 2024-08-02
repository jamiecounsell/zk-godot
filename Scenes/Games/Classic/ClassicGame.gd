extends Game

var player : GamePlayer

var score

func _init(root: Control, players : Array[GamePlayer]):
	if not players or players.size() == 0 or players.size() > 1:
		push_error("Classic Game requires exactly one player")
	self.player = players[0]
	root.add_child(self)
	score = root.get_node("GameArea/Scores/Score")

func _process(delta):
	score.score = player.score

func get_rounds():
	return [
		ClassicGameRound.new(player, 1)
	]
