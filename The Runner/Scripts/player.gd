extends CharacterBody2D

@onready var enemy = get_tree().get_nodes_in_group("enemy")[0]

const SPEED = 120
const JUMP_VELOCITY = -400.0
var rota:float
var dir: float

func _physics_process(delta: float) -> void:
	
	move_to(self,enemy.global_position,80,delta)
	
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
func get_player_pos() -> Vector2:
	return self.global_position
	
func move_to(body: CharacterBody2D, target_position: Vector2, speed: float, delta: float) -> void:
	var direction = (target_position - body.global_position).normalized()
	body.velocity = direction * speed
	body.move_and_slide()
