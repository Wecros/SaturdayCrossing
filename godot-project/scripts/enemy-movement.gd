extends KinematicBody2D

export (int) var speed = 10

func _ready():
	pass # Replace with function body.

func _process(delta):
	move_and_slide(Vector2(speed, 0))
	