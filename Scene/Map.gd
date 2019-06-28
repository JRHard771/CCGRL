extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in get_used_cells():
		GameData.map[n] = {
			"occupant": null,
			"items": []
		}
