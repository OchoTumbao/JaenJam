extends Control

@onready var top_text = %TopText
@onready var bottom_text = %BottomText

@onready var top_character = %TopCharacter
@onready var bottom_character = %BottomCharacter


var dialogue = []
var current_line = 0
var active = false

var mode : Global.Dialogue_mode

func start_dialogue(lines, interaction_mode):
	dialogue = lines
	current_line = 0
	active = true
	mode = interaction_mode
	
	show_line()


func show_line():
	var line = dialogue[current_line]

	top_text.text = ""
	bottom_text.text = ""

	top_text.text = line.get("top", "")
	bottom_text.text = line.get("bottom", "")
	if mode == Global.Dialogue_mode.AUTO:
		await get_tree().create_timer(line.get("time",2.0)).timeout
		if (active):
			next_line()

	
func _unhandled_input(event):
	if not active:
		return
	
	if mode != Global.Dialogue_mode.MANUAL:
		return
	
	if event.is_action_pressed("Dialogue"):
		next_line()


func next_line():
	current_line += 1

	if current_line >= dialogue.size():
		end_dialogue()
	else:
		show_line()


func end_dialogue():
	active = false
	
	top_text.text = ""
	bottom_text.text = ""
	
	dialogue.clear()
