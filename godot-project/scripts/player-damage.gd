extends Area2D

export (NodePath) var respawn_point

func _on_TriggerArea_body_entered(body):
	reset_player()

func reset_player():
	var player = get_node("../../Player")
	var respawn_point_node = get_node(respawn_point)
	respawn_point_node.spawn()
	