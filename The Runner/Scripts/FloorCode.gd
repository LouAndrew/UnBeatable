extends KinematicBody2D

onready var player = get_tree().get_nodes_in_group("Player")[0]
var velocity = Vector2.ZERO
var Position = self.global_position
onready var SpawnPoint = $Position2D

func _physics_process(delta: float) -> void:
	self.global_position.x = player.global_position.x
	floorVisibility()
func floorVisibility():
	if player.global_position.y >= 500:
		$Sprite.visible = true
	else:
		$Sprite.visible = false
