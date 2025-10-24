extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 200
var speed = 200
func _physics_process(delta: float) -> void:
	moveMent()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity,Vector2.ZERO)
func moveMent():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
