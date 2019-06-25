extends CanvasLayer

var hand_size = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func arrange_cards():
	var total = get_child_count()
	for i in range(total):
		var child = get_child(i)
		var ratio = (i+1) / (total+1.0)
		var angle = lerp(-10,10,ratio)
		child.dest_rotation = angle
		child.dest_position = Vector2(ratio * 1600 - 288, pow(abs(sin(deg2rad(angle))) * 48, 2))

func add_card(card_node):
	add_child(card_node)
	arrange_cards()

func remove_card(card_node):
	remove_child(card_node)
	arrange_cards()
