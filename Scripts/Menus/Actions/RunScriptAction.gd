extends "res://Scripts/Menus/Actions/Action.gd"

func execute(_node):
	var output = []
	OS.execute("ls", ["-l", "/tmp"], output)
