extends CharacterBody2D

@onready var enemy = get_tree().get_nodes_in_group("enemy")[0]

var SPEED: float = 10
var Maxspeed:float = 400
var acceleration:float = 1800

var down:float = 0.0
var up:float = -180
var left:float = 90
var right:float = -90

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_accept"):
		Engine.time_scale = 0.5
	else:
		Engine.time_scale = 1
		
	movement(delta)
	move_and_slide()
	
func movement(delta) -> void:
	user_input("ui_down",Maxspeed,down,0,delta); user_input("ui_up",-Maxspeed,up,1,delta)
	user_input("ui_right",Maxspeed,right,2,delta); user_input("ui_left",-Maxspeed,left,3,delta)
		
func user_input(input:String,speed:int,dir:float,look:int,delta):
	if Input.is_action_pressed(input):
		self.rotation_degrees = dir
		if (look == 0) or (look == 1):
			speed_calibrate(delta,SPEED,speed,Vector2(0,1))
		elif (look == 2) or (look == 3):
			speed_calibrate(delta,SPEED,speed,Vector2(2,3))
			
func get_player_pos() -> Vector2:
	return self.global_position
	
func speed_calibrate(delta,current_speed:float,max_speed:float,dir:Vector2):
	if (current_speed < 0):
		print(current_speed)
		current_speed -= acceleration * delta
		current_speed = max(current_speed,max_speed)
		if (dir == Vector2(0,1)):
			velocity.y = current_speed
			velocity.x = 0
	elif (current_speed > 0):
		print(current_speed)
		current_speed += acceleration * delta
		current_speed = min(SPEED,max_speed)
		if (dir == Vector2(2,3)):
			velocity.y = 0
			velocity.x = current_speed
func move_to(body: CharacterBody2D, target_position: Vector2, speed: float, _delta: float) -> void:
	var direction = (target_position - body.global_position).normalized()
	body.velocity = direction * speed
	body.move_and_slide()
