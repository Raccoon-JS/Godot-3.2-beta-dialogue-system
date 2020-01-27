extends Node

var file = File.new().open("res://dialogues/lines.json",File.READ)

func _ready():
	
	JSON.parse(file)
	pass
