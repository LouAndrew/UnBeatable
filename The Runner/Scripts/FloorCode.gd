extends StaticBody2D

onready var player = get_tree().get_nodes_in_group("Player")[0]
var Position = self.global_position
onready var SpawnPoint = $Position2D

func _process(delta: float) -> void:
	InstanceFloor()
	
func InstanceFloor():
	if player.global_position.x > (Position.x+384):
		queue_free()
