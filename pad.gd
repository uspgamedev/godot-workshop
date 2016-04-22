
extends RigidBody2D

export var side = 1

onready var pos = get_pos()

var dir = -1

func _ready():
	down()
	set_fixed_process(true)

func up():
	dir = -1

func down():
	dir = 1

func degree(rads):
	return 360*rads/(2*PI)

func _fixed_process(delta):
	set_pos(pos)
	var active = 1
	if side > 0:
		if get_rot() > PI/6:
			active = 0
			set_rot(PI/6 - .1)
		elif get_rot() < -PI/6:
			active = 0
			set_rot(-PI/6 + .1)
	elif side < 0:
		var rot = fmod(2*PI + get_rot(),2*PI)
		if rot > PI + PI/6:
			active = 0
			set_rot(PI + PI/6 - .1)
		elif rot < PI - PI/6:
			active = 0
			set_rot(PI - PI/6 + .1)
	set_angular_velocity(active*side*dir*10)

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,0))
	#state.integrate_forces()
