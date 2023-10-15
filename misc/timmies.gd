extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if get_overlapping_bodies().size() > 0:
		if get_tree().current_scene.name == "level_04" :
			get_tree().change_scene_to_file("res://cutscenes/ending_cut.tscn")
