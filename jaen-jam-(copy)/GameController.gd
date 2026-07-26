class_name GameController extends Node

@onready var game: Node2D = $Game

var currentScene


func _ready() -> void:
	Global.gameController = self
	currentScene = %Opening

func changeScene(newScene: String, delete: bool = true, keep_running: bool = false) -> void:
	if currentScene != null :
		if delete:
			currentScene.queue_free()
		elif keep_running:
			currentScene.visible = false
		else:
			game.remove_child(currentScene)
	var new = load(newScene).instantiate()
	game.add_child(new)
	currentScene = new
	
