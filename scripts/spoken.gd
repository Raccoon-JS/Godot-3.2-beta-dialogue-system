extends Node

var first = {
	"opening":{
		"type": "dialogue",
		"picture":"res://images/MomAndDad.png",
		"line": "Hello, dear.",
			"click":{
				"value": "intro"
			}
	},
	"intro": {
		"type":"choice",
		"picture":"res://images/Bathtime.png",
		"line": "Want to visit the shop?",
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
		"type":"choice",
		"picture":"res://images/yukari_&_mitsuru_5.png",
		"line": "What is your favorite bread?",
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
