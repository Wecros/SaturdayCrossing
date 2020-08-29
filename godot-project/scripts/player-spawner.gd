extends Node2D

export (PackedScene) var player_scene
onready var player = player_scene.instance()

func _ready():
	spawn()

func spawn():
	add_child(player)
