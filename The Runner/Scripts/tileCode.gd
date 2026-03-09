extends StaticBody2D

@onready var sprite:Node2D = self.get_child(1)
@onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready() -> void:
	sprite.scale = Vector2(0.5,0.5)
	sprite.visible = false
	
func _process(delta: float) -> void:
	if global_position.distance_to(player.get_player_pos()) <= 200:
		sprite.visible = true
		interpolateScale(delta,Vector2(1.0,1.0),sprite)
	else:
		if sprite.scale <= Vector2(0.5,0.5):
			sprite.visible = false
		interpolateScale(delta,Vector2(0.0,0.0),sprite)
		
func interpolateScale(delta,targetScale:Vector2,sprite:Node2D):
	var t = 0.05
	t += delta * 0.4
	sprite.scale = sprite.scale.lerp(targetScale,t)
	
