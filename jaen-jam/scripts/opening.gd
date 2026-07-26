extends Node2D

func _ready() -> void:
	var dialogue = Global.loadDialogueJson("res://dialogues/intro.json")
	%DialogueManager.dialogue_finished.connect(on_dialogue_finished)
	%DialogueManager.start_dialogue(dialogue,Global.Dialogue_mode.MANUAL)

func on_dialogue_finished() -> void:
	Global.gameController.changeScene("res://scenes/Phase1.tscn")
