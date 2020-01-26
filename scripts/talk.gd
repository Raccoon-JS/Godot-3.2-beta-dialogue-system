extends Node

export (String, FILE, "*.json") var lines

const scene_dialogue = {
	"intro": {
		"dialogue": "Want to visit the shop?",
			"left": {
				"text": "Thanks!",
				"value": "bread_type"
			},
			"right": {
				"text": "No thanks. I'm good.",
				"value": "quit"
			}
	}, 
	"bread_type": {
		"dialogue": "What is your favorite bread?",
			"left": {
				"text": "castella",
				"value": "load_shop"
			},
			"right": {
				"text": "baugette",
				"value": "load_shop"
			}
	},
	"load_shop": {
		"func": "change_scene",
		"args": ["res://scenes/shop.tscn"]
	},
	"quit":{
		"func": "quit_game",
		"args": []
	}
} 

var dialogue = {}
var state = {}

func _ready():
	set_state(scene_dialogue["intro"])
	set_dialogue(scene_dialogue)
	process_state(state)
	pass

func change_scene(scene):
	if get_tree().change_scene(scene) != 0:
		get_tree().quit()
	pass

func quit_game():
	get_tree().quit()

func display_state(dis_state):
	$dialogue_box/dialogue.text = dis_state["dialogue"]
	$left.text = dis_state["left"]["text"]
	$right.text = dis_state["right"]["text"]
	pass

func set_state(new_state):
	state = new_state
	pass

func set_dialogue(new_dialogue):
	dialogue = new_dialogue
	pass

func process_state(p_state):
	if p_state.has("func"):
		callv(p_state["func"], p_state["args"])
	if p_state.has("dialogue"):
		display_state(p_state)
		set_state(p_state)
	pass

func _on_yes_pressed():
	#state = dialogue[state["affirmative"]["value"]]
	process_state(dialogue[state["left"]["value"]])
	pass # Replace with function body.

func _on_no_pressed():
	#state = dialogue[state["negative"]["value"]]
	process_state(dialogue[state["right"]["value"]])
	pass # Replace with function body.
