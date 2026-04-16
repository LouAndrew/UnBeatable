extends Sprite2D

@onready var arrows:Array = [$Sprite2D,$Sprite2D2,$Sprite2D3,$Sprite2D4]
@onready var arrowBg:Sprite2D = self
var openbg:bool = false
var slowMo:float = 0.2

func _ready() -> void:
	arrowBg.scale = Vector2(0,0)

func _process(delta: float) -> void:
	self.global_position = $"../CharacterBody2D".global_position
	playerInput(delta,"ui_up",0);playerInput(delta,"ui_right",1)
	playerInput(delta,"ui_down",2);playerInput(delta,"ui_left",3)
	
	if openbg == false:
		interpolateScale(delta,Vector2(0,0),arrowBg)
			
			
func playerInput(delta,key:String,arrow:int):
	if Input.is_action_pressed(key):
		openbg = true 
		#Engine.time_scale = slowMo
		interpolateScale(delta,Vector2(1,1),arrowBg)
		arrows[arrow].self_modulate = Color(1,1,1,1)
		for i in range(arrows.size()):
			if i != arrow:
				arrows[i].self_modulate = Color(1,1,1,0.5)
	elif Input.is_action_just_released(key):
		openbg = false
		Engine.time_scale = 1
		
func interpolateScale(delta,targetScale:Vector2,sprite:Node2D):
	var t = 0.05
	t += delta * 0.4
	sprite.scale = sprite.scale.lerp(targetScale,t)
