extends Node

onready var player = get_tree().get_nodes_in_group("Player")[0]
#onready var Floor = get_tree().get_nodes_in_group("floor")[0]



func _physics_process(_delta: float) -> void:
	#var floorPos = Floor.global_position
	#Instance_Floor(floorPos)
	pass
#func Instance_Floor(var FP:Vector2):
#	if player.global_position.x >= (FP.x+384):
#		var TheFloor = preload("res://Scenes/Floor.tscn").instance()
#		get_parent().add_child(TheFloor)
#		TheFloor.global_transform = Floor.SpawnPoint.global_transform
