extends Node2D

func _ready() -> void:
	Global.spawn_bee(self, false, 800)
	var intro = Global.loadDialogueJson("res://dialogues/intro.json")
	%DialogueManager.start_dialogue(intro, Global.Dialogue_mode.MANUAL)
