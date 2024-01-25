extends Node

var music = AudioStreamPlayer2D.new()

func playOnce(sound: String):
	var stream = AudioStreamPlayer2D.new()
	self.add_child(stream)
	stream.finished.connect(stream.queue_free)
	stream.stream = load(sound)
	stream.play()
	return stream

func play(sound : String):
	music.stream = load(sound)
	self.add_child(music)
	# music.play()
	return music
