extends Area2D

export (NodePath) var spawner_path

func _ready():
	pass # Replace with function body.

func _on_EnemyDestroyer_body_entered(body):
	var spawner = get_node(spawner_path)

	spawner.active_enemies.erase(body)
	body.queue_free()
