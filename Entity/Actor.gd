extends Node2D

tool

export var is_player = false setget set_is_player
export(Vector2) var grid_position setget set_grid_position
var strength_current = 3 setget set_strength_current
var strength_max = 3 setget set_strength_max
var strength_mod = 0 setget set_strength_mod
var agility_current = 3 setget set_agility_current
var agility_max = 3 setget set_agility_max
var agility_mod = 0 setget set_agility_mod
var intelligence_current = 3 setget set_intelligence_current
var intelligence_max = 3 setget set_intelligence_max
var intelligence_mod = 0 setget set_intelligence_mod

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.editor_hint:
		GameData.map[grid_position]["occupant"] = self
		if not is_player:
			set_process_input(false)
		else:
			HUD.update(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move(dx, dy):
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
	$Tween.interpolate_property(self, 'position', position, grid_position * 16, 0.167,
		Tween.TRANS_SINE, Tween.EASE_OUT)
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

func set_strength_current(val):
	strength_current = val
	if is_player:
		HUD.update(self)

func set_strength_max(val):
	strength_max = val + strength_mod
	if is_player:
		HUD.update(self)

func set_strength_mod(val):
	strength_max -= strength_mod
	strength_mod = val
	strength_max += strength_mod
	if is_player:
		HUD.update(self)

func set_agility_current(val):
	agility_current = val
	if is_player:
		HUD.update(self)

func set_agility_max(val):
	agility_max = val + agility_mod
	if is_player:
		HUD.update(self)

func set_agility_mod(val):
	agility_max -= agility_mod
	agility_mod = val
	agility_max += agility_mod
	if is_player:
		HUD.update(self)

func set_intelligence_current(val):
	intelligence_current = val
	if is_player:
		HUD.update(self)

func set_intelligence_max(val):
	intelligence_max = val + intelligence_mod
	if is_player:
		HUD.update(self)

func set_intelligence_mod(val):
	intelligence_max -= intelligence_mod
	intelligence_mod = val
	intelligence_max += intelligence_mod
	if is_player:
		HUD.update(self)

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
