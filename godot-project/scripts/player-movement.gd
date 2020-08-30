extends KinematicBody2D

export (int) var speed = 200
var freeze = false

var velocity = Vector2()

var PLAYER_RIGHT
var PLAYER_LEFT
var PLAYER_UP
var PLAYER_DOWN

func _init():
	PLAYER_RIGHT = 'player-1-right'
	PLAYER_LEFT = 'player-1-left'
	PLAYER_UP = 'player-1-up'
	PLAYER_DOWN = 'player-1-down'

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed(PLAYER_RIGHT):
        velocity.x += 1
    if Input.is_action_pressed(PLAYER_LEFT):
        velocity.x -= 1
    if Input.is_action_pressed(PLAYER_DOWN):
        velocity.y += 1
    if Input.is_action_pressed(PLAYER_UP):
        velocity.y -= 1
    velocity = velocity.normalized() * speed

func _physics_process(delta):
	if freeze:
		return
	get_input()
	velocity = move_and_slide(velocity)