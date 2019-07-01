extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var wall = false
	for n in get_used_cells():
		wall = true if get_cell(n.x, n.y) == 1 else false
		GameData.map[n] = {
			"wall": wall,
			"occupant": null,
			"items": []
		}
