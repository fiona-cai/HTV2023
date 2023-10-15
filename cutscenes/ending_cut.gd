extends Node2D

var timer: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta 
	if timer > 5:
		get_tree().change_scene_to_file("res://cutscenes/explode.tscn")
