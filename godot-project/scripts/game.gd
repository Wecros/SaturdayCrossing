extends Node

var game_started = false

func _ready():
	start_new_game()

func start_new_game():
	game_started = false
	
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
	
	var player1 = get_node("/root/Main/Game/Player")
	var player2 = get_node("/root/Main/Game/Player2")
	player1.freeze = true
	player2.freeze = true
	player1.visible = true
	player2.visible = true
	
	var spawner1 = get_node("Game/EnemySpawner")
	var spawner2 = get_node("Game/EnemySpawner2")
	spawner1.start_spawning()
	spawner2.start_spawning()
		
	var start_timer = get_node("Game/StartTimer")
	start_timer.start()

func _process(delta):
	if (not game_started):
		var start_timer = get_node("Game/StartTimer")
		var timer_label = get_node("UI/TimerLabel")
		
		timer_label.text = str(start_timer.time_left + 1)[0]
		if start_timer.time_left == 0:
			timer_label.text = "go!"
			get_node("UI/TimerLabel/Timer").start()
			
			var player1 = get_node("/root/Main/Game/Player")
			var player2 = get_node("/root/Main/Game/Player2")
			player1.freeze = false
			player2.freeze = false

			game_started = true
		
	