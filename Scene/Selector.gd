extends Sprite

const snap = Vector2(16,16)
const mouse_offset = Vector2(8,8)
var grid_position = Vector2(0,0)
var alpha setget set_alpha, get_alpha

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_alpha(val):
	modulate.a = val

func get_alpha():
	return modulate.a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var test = (get_global_mouse_position() - mouse_offset).snapped(snap) / 16
	if test != grid_position:
		grid_position = test
		position = test * 16
		$Tween.stop_all()
		$Tween.interpolate_property(self, "alpha", 0.084, 0.916, 1, Tween.TRANS_SINE, Tween.EASE_OUT)
		if GameData.map.has(grid_position):
			var target = GameData.map[grid_position]["occupant"]
			if target:
				if target.is_player:
					modulate = Color(0,0.5,1,0)
				else:
					modulate = Color(1,0.25,0,0)
			else:
				modulate = Color(1,1,1,0)
		$Tween.start()
