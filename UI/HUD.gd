extends CanvasLayer

func update(actor):
	$MarginContainer/HBoxContainer/StrLabel.text = "%s/%s" % [actor.strength_current, actor.strength_max]
	$MarginContainer/HBoxContainer/AgiLabel.text = "%s/%s" % [actor.agility_current, actor.agility_max]
	$MarginContainer/HBoxContainer/IntLabel.text = "%s/%s" % [actor.intelligence_current, actor.intelligence_max]
