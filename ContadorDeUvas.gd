extends Label

var count = 0

func _ready():
	events.connect("nueva_uva", self, "_on_nueva_uva")

func _on_nueva_uva():
	count += 1
	text = "Uvas: %d" % count


func _on_Button_button_down():
	_on_nueva_uva()
