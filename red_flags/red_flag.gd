extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if get_overlapping_bodies().size() > 0:

		if get_tree().current_scene.name == "level_01" :
			get_tree().change_scene_to_file("res://levels/level_02.tscn")
