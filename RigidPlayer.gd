extends RigidBody2D

const IMPULSE_MAGNITUDE = 800
var uva_template = preload("res://Uva.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _integrate_forces(physicState : Physics2DDirectBodyState) -> void:

	var dir:Vector2
	if Input.is_action_just_pressed("ui_left"):
		dir = Vector2(-1,2)
		
	elif Input.is_action_just_pressed("ui_right"):
		dir = Vector2(1,2)
		
		
	if dir:
		dir = dir.rotated(rotation)
		apply_impulse(Vector2(0,20),-dir*IMPULSE_MAGNITUDE)
		_fire_uva(dir)

func _fire_uva(vec):
	var uva = uva_template.instance()
	get_parent().add_child(uva)
	uva.global_position = global_position + vec * 20
	uva.linear_velocity = vec * 100
	events.emit_signal("nueva_uva")