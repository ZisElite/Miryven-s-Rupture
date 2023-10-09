extends Node
class_name Data

var path = "user://save.dat"

var character: Dictionary:
	get:
		return character
	set(value):
		character = value

var woodcutting: Dictionary:
	get:
		return woodcutting
	set(value):
		woodcutting = woodcutting


func serialize():
	pass

func deserialize(value):
	pass
