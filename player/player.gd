extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
const BAR_SPD = 500
var screen_size
var gravity = 3000
var dg = -5
@export var AwakeBar: PackedScene = preload("res://misc/awake_bar.tscn")

var JumpSound: PackedScene = preload("res://sounds/boing.tscn")
var Pew: PackedScene = preload("res://sounds/pewpew.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		var jump_sound = JumpSound.instantiate()
		owner.add_child(jump_sound)
		jump_sound.play()
		#jumpSound.play()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("shoot_button"):
		var ab = AwakeBar.instantiate()
		owner.add_child(ab)
		if $AnimatedSprite2D.flip_h:
			ab.init(BAR_SPD, position.x, position.y)
		else:
			ab.init(-BAR_SPD, position.x, position.y)
		var pew = Pew.instantiate()
		owner.add_child(pew)
		pew.play()
	
	if velocity.x > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true

	gravity += dg
	if gravity < 1500:
		dg = 5
	elif gravity > 3000:
		dg = -5
	move_and_slide()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
