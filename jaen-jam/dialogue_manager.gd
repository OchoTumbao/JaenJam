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
	
	if top_text.text != "":
		portrait_jump(%TopPortrait)
	if bottom_text.text != "":
		portrait_jump(%BottomPortrait)
	
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

func portrait_jump(portrait: TextureRect):

	var start_pos = portrait.position
	var start_scale = portrait.scale
	var start_rotation = portrait.rotation_degrees

	var tween = create_tween()

	# Subida y énfasis inicial
	tween.set_parallel(true)

	tween.tween_property(
		portrait,
		"position",
		start_pos + Vector2(0, -35),
		0.25
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	tween.tween_property(
		portrait,
		"scale",
		Vector2(1.18, 1.18),
		0.25
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	tween.tween_property(
		portrait,
		"rotation_degrees",
		-4,
		0.25
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


	# Mantener la pose un rato
	tween.set_parallel(false)
	tween.tween_interval(0.5)


	# Volver lentamente
	tween.set_parallel(true)

	tween.tween_property(
		portrait,
		"position",
		start_pos,
		0.6
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(
		portrait,
		"scale",
		start_scale,
		0.6
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(
		portrait,
		"rotation_degrees",
		start_rotation,
		0.6
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
