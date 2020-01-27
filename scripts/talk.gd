extends Node

#export (String, FILE, "*.json") var lines

var scene_dialogue = spoken.first
var state = {}
var dialogue = {}

func _ready():
	set_state(scene_dialogue["opening"])
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
	$character.texture = load(dis_state["picture"])
	if dis_state["type"] == "dialogue":
		$dialogue_box/dialogue.text = dis_state["line"]
		$left.disabled = true
		$right.disabled = true
	elif dis_state["type"] == "choice":
		$left.disabled = false
		$right.disabled = false
		$dialogue_box/dialogue.text = dis_state["line"]
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
	if p_state.has("line"):
		display_state(p_state)
		set_state(p_state)
	pass

func _input(event):
	#print(state)
	if state["type"] == "dialogue":
		if event.is_action_pressed("mouse_left"):
			process_state(dialogue[state["click"]["value"]])
			#set_state(scene_dialogue["intro"])
	pass

func _on_yes_pressed():
	#state = dialogue[state["affirmative"]["value"]]
	process_state(dialogue[state["left"]["value"]])
	pass # Replace with function body.

func _on_no_pressed():
	#state = dialogue[state["negative"]["value"]]
	process_state(dialogue[state["right"]["value"]])
	pass # Replace with function body.
