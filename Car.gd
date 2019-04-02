extends Node2D

export (float) var speed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	var angle = 0.0
	
	if Input.is_action_pressed("ui_up"):
		speed += 0.1
	if Input.is_action_pressed("ui_down"):
		speed -= 0.1
		
	if Input.is_action_pressed("ui_left"):
		angle -= 0.01
	if Input.is_action_pressed("ui_right"):
		angle += 0.01

	rotation += angle;
	var velocity = Vector2(cos(-rotation + PI/2) * speed, -sin(-rotation + PI/2) * speed)
	position += velocity;
	