extends TextureRect

var timer : float = 0.0
var firstAnimatedTimer: float = (5 + 3.3 + 1)
var secondAnimatedTimer: float = (25.0) # same as thirdTime

# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture(load("res://art/backgrounds/mad_scientist_background.tres") as Texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	timer += delta 
	
	if(timer >= firstAnimatedTimer and timer < secondAnimatedTimer):
		set_texture(load("res://art/backgrounds/mad_scientist_happy.tres") as Texture)
	elif(timer >= secondAnimatedTimer):
		set_texture(load("res://art/backgrounds/Rhino.tres") as Texture)
		
	pass
