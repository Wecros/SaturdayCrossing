extends Node

func _ready():
	start_new_game()

func start_new_game():
	var label_right = get_node("UI/PointLabelRight") 
	var label_left = get_node("UI/PointLabelLeft") 
	var labels = [label_right, label_left]

	for label in labels:
		label.score = 0
		
	var labels_to_hide = [
		get_node("UI/VictoryLabelBlue"),
		get_node("UI/VictoryLabelRed"),
		get_node("UI/InfoLabel"),
	]
	
	for label in labels_to_hide:
		label.visible = false
		
	