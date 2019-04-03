extends Node2D

export (float) var ACCELERATION
export (float) var TURNING

var speed = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	var angle = 0.0
	
	if Input.is_action_pressed("ui_up"):
		speed += ACCELERATION
	if Input.is_action_pressed("ui_down"):
		speed -= ACCELERATION
		
	if Input.is_action_pressed("ui_left"):
		angle -= TURNING
	if Input.is_action_pressed("ui_right"):
		angle += TURNING

	rotation += angle;
	var velocity = Vector2(cos(-rotation + PI/2) * speed, -sin(-rotation + PI/2) * speed)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
        var collision_point = collision_info.position

    