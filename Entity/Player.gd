extends Node2D

const grid = Vector2(16, 16)
onready var dest_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_coords = position.snapped(grid) / 16 - Vector2(1, 1)
	GameData.map[tile_coords]["occupant"] = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.linear_interpolate(dest_position, delta * 10)

func _input(event):
	var tile_coords = position.snapped(grid) / 16 - Vector2(1, 1)
	GameData.map[tile_coords]["occupant"] = null
	if event.is_action_pressed("move_north"):
		dest_position.y -= 16
	elif event.is_action_pressed("move_south"):
		dest_position.y += 16
	elif event.is_action_pressed("move_west"):
		dest_position.x -= 16
	elif event.is_action_pressed("move_east"):
		dest_position.x += 16
	tile_coords = position.snapped(grid) / 16 - Vector2(1, 1)
	GameData.map[tile_coords]["occupant"] = self
