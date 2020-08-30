extends Area2D

export (int) var score_to_win = 10
export (NodePath) var player_1_point_label
export (NodePath) var player_2_point_label
export (NodePath) var player_1_victory_label
export (NodePath) var player_2_victory_label
export (NodePath) var info_label_path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Victory_Area_area_entered(area):
	var player = get_player(area)
	var spawner = get_spawner(player)
	var label = get_label(player)

	label.score += 1
	if (label.score >= score_to_win):
		show_victory(player)

	spawner.spawn()
	
func get_player(area):
	var player = area.get_parent()
	return player
	
func get_spawner(player):
	if player.name == "Player":
		return get_node("/root/Main/Game/PlayerSpawner")
	else:
		return get_node("/root/Main/Game/PlayerSpawner2")

func get_label(player):
	if player.name == "Player":
		return get_node(player_1_point_label)
	else:
		return get_node(player_2_point_label)
	
func show_victory(player):
	var victory_label
	if player.name == "Player":
		victory_label = get_node(player_1_victory_label)
	else:
		victory_label = get_node(player_2_victory_label)

	var info_label = get_node(info_label_path)
#
	victory_label.visible = !victory_label.visible
	info_label.visible = !info_label.visible

	var player1 = get_node("/root/Main/Game/Player")
	var player2 = get_node("/root/Main/Game/Player2")
	player1.freeze = true
	player2.freeze = true
	player1.visible = false
	player2.visible = false
	
#
#func _process(delta):
#	Input.is_action_pressed("new_game"):
#		print('test')
	