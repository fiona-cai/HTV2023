extends Label

var timer: float = 0.0
# mad scientist
var firstTime: float = 10.0 
var secondTime: float = 20.0
# rhino
var thirdTime: float = 25.0
var fourthTime: float = 35.0
var fifthTime: float = 45.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.text = "One day, a mad scientist professor created a machine to hypnotize his sleep deprived cs students to make them come to class."
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta 
	
	if timer >= firstTime and timer < secondTime:
		self.text = str("His method was linearizing gravity with linear algebra to drag them into the classroom! This made plants very sad to the point that they were on the verge of extinction :(")
	elif timer >= secondTime and timer < thirdTime:
		self.text = str("what will the world do...")
	elif timer >= thirdTime and timer < fourthTime:
		self.text = str("Meet Racket the Rhino, the deforestation fighter. living in his forest, he attacks every human there to harm his home. with his trusty catapult, he will defend his home...")
	elif timer >= fourthTime and timer < fifthTime: 
		self.text = str("Huh, look there. it's some stinky humans. They look very sleepy, lets fire awake bars at them!")
	elif timer >= fifthTime:
		get_tree().change_scene_to_file("res://levels/level_01.tscn")
