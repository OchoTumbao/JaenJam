extends Node2D

func _ready() -> void:
	Global.spawn_bee(self, false, 1920)
	Global.spawn_cat(self, true, 1800)
