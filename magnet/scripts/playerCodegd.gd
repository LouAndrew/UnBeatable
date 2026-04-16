extends CharacterBody2D

const SPEED:int = 2000


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED * delta
	elif  Input.is_action_pressed("ui_down"):
		velocity.y = SPEED * delta
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED * delta
	move_and_slide()

func get_player_global_pos() -> Vector2:
	return global_position
