extends Area2D

var min_x 
var min_y
var max_x
var max_y

onready var colshape2d = get_node("CollisionShape2D")
export (Array, PackedScene) var enemies

var size
var centerpos

func _ready():
	centerpos = colshape2d.position + position
	size = colshape2d.shape.extents
	
func spawn():
	var x = centerpos.x
	var y = (randi() % size.y) - (size.y/2) + centerpos.y
	
	