extends Node

@onready var sprites:Array = [$Sprite2D,$Sprite2D2,$Sprite2D3,$Sprite2D4]
var num : int = 4
var heart_num:int = 4

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		num -= 1
	reduce_heart()
	
func reduce_heart():
	if num == 4:
		sprites[3].visible = true
	elif num < 4:
		sprites[3].visible = false
		
	if num == 3:
		sprites[2].visible = true
	elif num < 3:
		sprites[2].visible = false
		
	if num == 2:
		sprites[1].visible = true
	elif num < 2:
		sprites[1].visible = false
		
	if num == 1:
		sprites[0].visible = true
	elif num < 1:
		sprites[0].visible = false
	
	
