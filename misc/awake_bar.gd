extends Area2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(spd, px, py):
	speed = spd
	position.x = px
	position.y = py

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# print(get_overlapping_areas(), get_overlapping_bodies())
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			queue_free()
			body.queue_free()

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()

