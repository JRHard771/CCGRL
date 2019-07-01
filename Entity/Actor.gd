extends Node2D

tool

export var is_player = false setget set_is_player
export(Vector2) var grid_position setget set_grid_position

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.editor_hint:
		GameData.map[grid_position]["occupant"] = self
		if not is_player:
			set_process_input(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move(dx, dy):
	if not Engine.editor_hint:
		var dvec = grid_position + Vector2(dx, dy)
		if GameData.map[dvec]["wall"] or GameData.map[dvec]["occupant"]:
			$Tween.interpolate_property(self, 'position', position + Vector2(dx, dy) * 4,
				grid_position * 16, 0.333, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
			$Tween.start()
			return false
		GameData.map[grid_position]["occupant"] = null
		grid_position.x += dx
		grid_position.y += dy
		GameData.map[grid_position]["occupant"] = self
		$Tween.interpolate_property(self, 'position', position, grid_position * 16, 0.333,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start()
		return true

func set_is_player(val):
	is_player = val
	set_process_input(val)
	$Sprite.flip_h = val

func set_grid_position(vec2):
	vec2 = Vector2(int(vec2.x), int(vec2.y))
	grid_position = vec2
	position = grid_position * 16

func _input(event):
	if not Engine.editor_hint:
		if event.is_action_pressed("move_north"):
			move(0, -1)
		elif event.is_action_pressed("move_south"):
			move(0, 1)
		elif event.is_action_pressed("move_west"):
			move(-1, 0)
		elif event.is_action_pressed("move_east"):
			move(1, 0)
