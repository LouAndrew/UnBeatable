extends Sprite2D

@export var size: Vector2 = self.scale
@export var targetPos: Vector2
@export var weight: float = 0.01
@onready var button: Button = $Button

func _ready() -> void:
	button.connect("pressed",_on_button_pressed)
	
func _process(delta: float) -> void:
	pass
	
func _on_button_pressed():
	pass
	
func interpolateEl(delta,element:Sprite2D,target:Vector2,rate):
	rate = 0.01
	rate *= 0.4 * delta
	element.position = element.position.lerp(target,rate)
	
func interpolateScale(delta,element:Sprite2D,target:Vector2,rate):
	rate = 0.01
	rate += 0.4 * delta
	element.scale = element.scale.lerp(target,rate)
