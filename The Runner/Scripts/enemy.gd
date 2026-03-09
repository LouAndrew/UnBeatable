extends StaticBody2D

@onready var player:CharacterBody2D = get_tree().get_nodes_in_group("player")[0]
@onready var sprite = get_child(1)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.look_at(player.get_player_pos())
