extends KinematicBody2D

export (float) var SPEED_FACTOR
export (float) var TURN_FACTOR

var velocity = Vector2(0,-1)
var speed = 0.0


func get_input():
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var forward = Input.is_action_pressed('ui_up')
	var backward = Input.is_action_pressed('ui_down')

	if forward:
		print("UP")
		speed += SPEED_FACTOR
	if backward:
		print("DOWN")
		speed -= SPEED_FACTOR
	if right:
		print("RIGHT")
		velocity = velocity.rotated(TURN_FACTOR)
	if left:
		print("LEFT")
		velocity = velocity.rotated(-TURN_FACTOR)


func _physics_process(delta):
	get_input()
	var collision_info = move_and_collide(velocity.normalized() * speed)
	rotation = velocity.angle() + PI/2
	if collision_info:
		var collision_point = collision_info.position