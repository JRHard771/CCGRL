extends Control

var hovered = false
var saved_rotation = 0
var cost_str = 0 setget set_cost_str, get_cost_str
var cost_agi = 0 setget set_cost_agi, get_cost_agi
var cost_int = 0 setget set_cost_int, get_cost_int

onready var dest_scale = self.rect_scale
onready var dest_position = self.rect_position
onready var dest_rotation = self.rect_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	rect_scale = rect_scale.linear_interpolate(dest_scale, delta * 10)
	rect_position = rect_position.linear_interpolate(dest_position, delta * 5)
	rect_rotation = lerp(rect_rotation, dest_rotation, delta * 10)

func _input(event):
	if hovered and event.is_action_pressed("ui_select"):
		set_card("Test")

func _on_mouse_entered():
	hovered = true
	dest_scale *= 1.5
	dest_position.y -= 89
	saved_rotation = dest_rotation
	dest_rotation = 0
	var daddy = get_parent()
	daddy.remove_child(self)
	daddy.add_child(self)

func _on_mouse_exited():
	hovered = false
	dest_scale /= 1.5
	dest_position.y += 89
	dest_rotation = saved_rotation

func set_card(new_id):
	$VBoxContainer/Title.bbcode_text = "[center]%s[/center]" % new_id
	$VBoxContainer/TextureRect.texture = load(GameData.card[new_id]["image"])
	$VBoxContainer/Description.bbcode_text = GameData.card[new_id]["desc"]
	set_cost_str(GameData.card[new_id]["cost_str"])
	set_cost_agi(GameData.card[new_id]["cost_agi"])
	set_cost_int(GameData.card[new_id]["cost_int"])

func update_cost():
	if not cost_str:
		$VBoxContainer/CostContainer/HBoxContainer/StrengthRect.hide()
		$VBoxContainer/CostContainer/HBoxContainer/StrCostLabel.hide()
	else:
		$VBoxContainer/CostContainer/HBoxContainer/StrengthRect.show()
		$VBoxContainer/CostContainer/HBoxContainer/StrCostLabel.show()
		$VBoxContainer/CostContainer/HBoxContainer/StrCostLabel.text = str(cost_str)
	if not cost_agi:
		$VBoxContainer/CostContainer/HBoxContainer/AgilityRect.hide()
		$VBoxContainer/CostContainer/HBoxContainer/AgiCostLabel.hide()
	else:
		$VBoxContainer/CostContainer/HBoxContainer/AgilityRect.show()
		$VBoxContainer/CostContainer/HBoxContainer/AgiCostLabel.show()
		$VBoxContainer/CostContainer/HBoxContainer/AgiCostLabel.text = str(cost_agi)
	if not cost_int:
		$VBoxContainer/CostContainer/HBoxContainer/IntelligenceRect.hide()
		$VBoxContainer/CostContainer/HBoxContainer/IntCostLabel.hide()
	else:
		$VBoxContainer/CostContainer/HBoxContainer/IntelligenceRect.show()
		$VBoxContainer/CostContainer/HBoxContainer/IntCostLabel.show()
		$VBoxContainer/CostContainer/HBoxContainer/IntCostLabel.text = str(cost_int)

func set_cost_str(val):
	cost_str = val
	update_cost()

func get_cost_str():
	return cost_str

func set_cost_agi(val):
	cost_agi = val
	update_cost()

func get_cost_agi():
	return cost_agi

func set_cost_int(val):
	cost_int = val
	update_cost()

func get_cost_int():
	return cost_int
