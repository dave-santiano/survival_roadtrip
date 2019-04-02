extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var roads = [];




# Called when the node enters the scene tree for the first time.
func _ready():
	roads = get_children();
	print(roads);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):

	if body.get_name() == "KinematicBody2D":
		roads[0].position = roads[-1].position + Vector2(0, -400);
		roads.append(roads.pop_front());
		

#		for i in range(0, roads.size()):
#			print(roads[i].position);

