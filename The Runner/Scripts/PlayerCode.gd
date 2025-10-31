extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 800
var speed = 400
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
	else:
		velocity.y = 0
		
func moveMent():
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -450
		$Sprite.play("Bouncing")
		print(velocity.y)
	velocity.x = speed
#func characterRotation(delta):
#	self.rotation += self.rotation_direction * 1 * self.speed * deltas
