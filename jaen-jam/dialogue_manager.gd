extends Control

@onready var top_text = %TopText
@onready var bottom_text = %BottomText

@onready var top_character = %TopCharacter
@onready var bottom_character = %BottomCharacter


var dialogue = []
var current_line = 0
var active = false

signal dialogue_finished

var mode : Global.Dialogue_mode

var portrait_state := {}

func _ready():
	portrait_state[%TopPortrait] = {
		"position": %TopPortrait.position,
		"scale": %TopPortrait.scale,
		"rotation": %TopPortrait.rotation_degrees
	}

	portrait_state[%BottomPortrait] = {
		"position": %BottomPortrait.position,
		"scale": %BottomPortrait.scale,
		"rotation": %BottomPortrait.rotation_degrees
	}


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
		%TopDialogue.visible = true
		portrait_jump(%TopPortrait)
	else:
		%TopDialogue.visible = false
		
	if bottom_text.text != "":
		%BottomDialogue.visible = true
		portrait_jump(%BottomPortrait)
	else:
		%BottomDialogue.visible = false
	
	if mode == Global.Dialogue_mode.AUTO:
		await get_tree().create_timer(line.get("time",2.0)).timeout
		if (active):
			next_line()

	
func _unhandled_input(event):
	if not active:
		return
	
	if mode != Global.Dialogue_mode.MANUAL:
		return
	
	if event.is_action_released("Dialogue"):
		next_line()
	if event.is_action_released("Skip_Dialogue"):
		end_dialogue()


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
	
	dialogue_finished.emit()

func portrait_jump(portrait: TextureRect):
	var state = portrait_state[portrait]

	portrait.position = state.position
	portrait.scale = state.scale
	portrait.rotation_degrees = state.rotation

	var start_pos = state.position
	var start_scale = state.scale
	var start_rotation = state.rotation

	var tween = create_tween()

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


	tween.set_parallel(false)
	tween.tween_interval(0.5)


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
