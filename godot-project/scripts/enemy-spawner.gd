extends Node2D

export (Array, PackedScene) var enemies
export (bool) var flipped

var active_enemies = []

onready var top_point = get_node("Top")
onready var bot_point = get_node("Bottom")

var size
var centerpos
var rand = RandomNumberGenerator.new()
	
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
	enemy.speed = rand.randi_range(20, 200)
	if flipped:
		enemy.speed *= -1
		enemy.scale.x *= -1

	add_child(enemy)
	active_enemies.append(enemy)
	
func stop_spawning():
	var timer = get_node("Timer")
	timer.stop()
	
func start_spawning():
	var timer = get_node("Timer")
	timer.start()
	for i in range(10):
		spawn()
	
func _on_Timer_timeout():
	var timer = get_node("Timer")
	var next_timeout = rand.randf_range(0.4, 1.0)
	timer.set_wait_time(next_timeout)
	
	rand.randomize()
	spawn()
