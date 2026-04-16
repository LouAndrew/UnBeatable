extends StaticBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale = Vector2(0,0)
	
func _process(delta: float) -> void:
	if (player.get_player_global_pos().distance_to(self.global_position)) < 100:
		$Sprite2D.visible = true
		interpolateScale(delta,Vector2(1,1),$Sprite2D)
	else:
		if $Sprite2D.scale <= Vector2(0.5,0.5):
			$Sprite2D.visible = false
		interpolateScale(delta,Vector2(0,0),$Sprite2D)
		
func interpolateScale(delta,targetValue:Vector2,element:Sprite2D):
	var t = 0.2
	t += delta * 0.4
	element.scale = element.scale.lerp(targetValue,t)
