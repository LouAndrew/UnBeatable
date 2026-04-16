extends TileMapLayer

var tile_Map:TileMapLayer = self
var usedCells = tile_Map.get_used_cells()
var tile_count = usedCells.size()

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	for i in range(usedCells.size()):
		var tile_data = tile_Map.get_cell_tile_data(usedCells[i])
		if tile_data:
			print(usedCells[i])
			if get_global_mouse_position().distance_to(usedCells[i]) <= 10:
				tile_data.modulate = Color(1,1,1,0.3)
			else:
				tile_data.modulate = Color(1,1,1,1)
