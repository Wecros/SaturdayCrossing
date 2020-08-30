extends Node

func _ready():
	start_new_game()

func start_new_game():
	var label_right = get_node("UI/PointLabelRight") 
	var label_left = get_node("UI/PointLabelLeft") 
	var labels = [label_right, label_left]

	for label in labels:
		label.text = "0"