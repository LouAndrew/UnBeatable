extends Node2D

@onready var button = $Button

func _ready() -> void:
	button.connect("pressed",on_button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if (get_global_mouse_position().distance_to(self.global_position) <= 50):
		modulate = Color()
		if Input.is_action_just_pressed("ui_accept"):
			on_button_pressed()
	else:
		modulate = Color(1,1,1,1)
	
		
func on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/playscene.tscn")
	
func interpolateScale(delta,targetScale:Vector2,sprite:Node2D):
	var t = 0.01
	t += delta * 0.4
	sprite.scale = sprite.scale.lerp(targetScale,t)
