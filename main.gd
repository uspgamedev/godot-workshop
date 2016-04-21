
extends Node2D

onready var ball      = get_node("ball")
onready var pad_left  = get_node("pad_left")
onready var pad_right = get_node("pad_right")

func _ready():
	set_process_input(true)
	start()

func start():
	ball.restart()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		start()
	elif event.is_action_pressed("ui_left"):
		pad_left.up()
	elif event.is_action_released("ui_left"):
		pad_left.down()
	elif event.is_action_pressed("ui_right"):
		pad_right.up()
	elif event.is_action_released("ui_right"):
		pad_right.down()