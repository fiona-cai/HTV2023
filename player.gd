extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

@export var g = 9
var dy = 0
@export var jump = 50
var on_ground = true

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		# velocity.y += 1
		pass
	if Input.is_action_pressed("move_up"): # and on_ground:
		# velocity.y -= 1
		dy -= jump

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
		
	g -= 1
	if g < 3:
		g = 9
	dy += g
	if position.y < 10: # totally not scuffed
		position.y = 10
		dy = 1
	# if position.y == :
		# on_ground = true TODO: this lol, later
	velocity.y = dy
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
