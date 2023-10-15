extends RigidBody2D

const MAX_VEL_LOL = 50
const SPEED = 5000
var steps = 0
var dir = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	# Set the angular velocity to zero to prevent rotation
	angular_velocity = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var velocity = Vector2(delta*dir*SPEED, 0)
	steps += delta
	if abs(velocity.x) > MAX_VEL_LOL:
		dir = dir*-1
		steps = 0
	var force = Vector2(100, 0)  # Replace with the desired force vector
	linear_velocity = velocity
