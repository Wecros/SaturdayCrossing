extends Node2D

export (Array, PackedScene) var enemies
export (bool) var flipped

onready var top_point = get_node("Top")
onready var bot_point = get_node("Bottom")

var size
var centerpos
var rand = RandomNumberGenerator.new()

func _ready():	
	for i in range(200):
		spawn()
	
func pickEnemyInstance(enemy_arr):
	rand.randomize()
	var idx = rand.randi_range(0, enemy_arr.size() - 1)
	return enemy_arr[idx].instance()
	
func spawn():
	var enemy = pickEnemyInstance(enemies)
	rand.randomize()
	var x = top_point.position.x
	var y = rand.randf_range(bot_point.position.y,  top_point.position.y)

	enemy.position.x = x
	enemy.position.y = y
	
	rand.randomize()
	enemy.speed = rand.randi_range(40, 100)
	if flipped:
		enemy.speed *= -1
		enemy.scale.x *= -1

	add_child(enemy)
	
	
	