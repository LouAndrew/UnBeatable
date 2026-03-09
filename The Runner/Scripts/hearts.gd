extends Node

@onready var original_sprite = $Sprite2D
var heart_num:int = 4

func _ready() -> void:
	pass
	#create_sprites(heart_num)
	
func create_sprites(val:int):
	var incremental_val:int = 30
	var i:int = 0
	while i < val:
		var new_sprite = original_sprite.duplicate()
		add_child(new_sprite)
		new_sprite.position = Vector2(original_sprite.global_position.x+incremental_val, 100) 
		i += 1 # Set new position
		print(new_sprite.position)
