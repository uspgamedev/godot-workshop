
extends RigidBody2D

export var MAX_SPEED = 800

var teleport = false

func _ready():
	set_fixed_process(true)

func rand_sign():
	return 1 - 2*randf()

func restart():
	teleport = true

func _fixed_process(delta):
	if teleport:
		set_pos(Vector2(300, 60))
		set_linear_velocity(Vector2(0, 0))
		apply_impulse(Vector2(0,0), Vector2(200*rand_sign(), 0))
		teleport = false
	var velocity = get_linear_velocity()
	if velocity.length_squared() > MAX_SPEED*MAX_SPEED:
		set_linear_velocity(velocity.normalized()*MAX_SPEED)
