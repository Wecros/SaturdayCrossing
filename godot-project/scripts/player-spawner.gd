extends Node2D

export (NodePath) var player_path

func _ready():
	spawn()

func spawn():
	var player = get_node(player_path)
	player.position = position

