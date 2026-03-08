extends Node

@export var wait_time:float
@onready var sprite:Node2D = self.get_child(1)
func _ready() -> void:
	sprite.scale = Vector2(0.0,0.0)
	
func _process(delta: float) -> void:
	if sprite.scale >= Vector2(0.0,0.0):
		wait_time -= 0.5
		if wait_time <= 0:
			interpolateScale(delta,Vector2(1.0,1.0),sprite)
	
func interpolateScale(delta,targetScale:Vector2,sprite:Node2D):
	var t = 0.01
	t += delta * 0.4
	sprite.scale = sprite.scale.lerp(targetScale,t)
	
