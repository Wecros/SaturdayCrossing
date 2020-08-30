extends Label

var score = 0

func _ready():
	text = str(score)

func _process(delta):
	text = str(score)