extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 200
var speed = 200
onready var floatingFloor = get_tree().get_nodes_in_group("floor")[0]

func _physics_process(delta: float) -> void:
	moveMent()
	GRAVITY(delta)
	velocity = move_and_slide(velocity,Vector2.ZERO)
	
func GRAVITY(delta):
	if global_position.y <= floatingFloor.global_position.y:
		velocity.y += gravity * delta
	elif Input.is_action_just_pressed("ui_up"):
		velocity.y = -400
		print(velocity.y)
	else:
		velocity.y = 0
		
func moveMent():
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -400
		print(velocity.y)
	velocity.x = speed
