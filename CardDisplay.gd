extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func arrange_cards():
	var total = get_child_count()
	for i in range(total):
		var child = get_child(i)
		var step = (i+1)/(total+2.0)
		var ratio = (i+1)/(total+1.0)
		var angle = lerp(-13,13,ratio)
		child.dest_rotation = angle
		child.dest_position = Vector2(step * 1280, pow(abs(sin(deg2rad(angle))) * 40, 2))

func add_card(card_node):
	add_child(card_node)
	arrange_cards()

func remove_card(card_node):
	remove_child(card_node)
	arrange_cards()
