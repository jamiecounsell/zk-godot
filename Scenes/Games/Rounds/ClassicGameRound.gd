class_name ClassicGameRound
extends GameRound

const BASE_SCORE = 100
var hole

func _init(player: GamePlayer, hole : int):
	super(player)
	print("Waiting for player %s to hit target %d" % player.id % hole)
	self.player = player
	self.hole = hole

func _on_ball(ball):
	if ball == hole:
		AudioService.playOnce("res://Sounds/UI/Complete_02.ogg")
		var score = hole * BASE_SCORE
		print("Hit target %d" % hole)
		player.increase_score(score)
		self.round_ended.emit()
	else:
		AudioService.playOnce("res://Sounds/UI/Execute_02.ogg")
