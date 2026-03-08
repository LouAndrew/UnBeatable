extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var rota:float
var dir: float

func _physics_process(delta: float) -> void:
	#eqevelocity = Vector2(SPEED,0).rotated(dir)
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	if Input.is_action_pressed("ui_accept"):
		Engine.time_scale = 0.5
	else:
		Engine.time_scale = 1
	movement()
	move_and_slide()
	
func movement() -> void:
	var Xdirection := Input.get_axis("ui_left", "ui_right")
	var Ydirection := Input.get_axis("ui_up","ui_down")
	if Ydirection:
		velocity.y = Ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	if Xdirection:
		velocity.x = Xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
