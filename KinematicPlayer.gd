extends KinematicBody2D

export(int) var GRAVITY = 2000.0
const WALK_SPEED = 400
const JUMP_SPEED = 800

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y =  -JUMP_SPEED
		
		
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		 velocity.x = 0

	velocity = move_and_slide(velocity, Vector2.UP)