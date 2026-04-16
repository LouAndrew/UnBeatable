extends Sprite2D

@onready var pauseImage : Sprite2D = self
@onready var button : Button = $Button
func _ready() -> void:
	button.connect("pressed",_on_button_pressed)
	
func _process(delta: float) -> void:
	if pauseImage.global_position.distance_to(get_global_mouse_position()) < 20:
		interpolateScale(delta,Vector2(1.2,1.2),pauseImage)
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().paused = true
	else:
		interpolateScale(delta,Vector2(1,1),pauseImage)
		
		
func _on_button_pressed():
	get_tree().paused = true
	
func interpolateScale(delta,targetScale:Vector2,sprite:Node2D):
	var t = 0.03
	t += delta * 0.4
	sprite.scale = sprite.scale.lerp(targetScale,t)
