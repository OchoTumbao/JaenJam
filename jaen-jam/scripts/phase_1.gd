extends Node2D

var cat_spawned = false
var taxi_spawned = false
var cart_spawned = false
var ending_ready = false

func _ready() -> void:
	Global.scoreController = %Score
	Global.spawn_bee(self, 2000, 600, 1)
	var beeDialogue = Global.loadDialogueJson("res://dialogues/Fase1Abeja.json")
	%DialogueManager.start_dialogue(beeDialogue, Global.Dialogue_mode.AUTO)
	%DialogueManager.dialogue_finished.connect(on_ending_dialogue_finished)
	

func _on_cat_wall_body_entered(body: Node2D) -> void:
	if !cat_spawned:
		Global.spawn_cat(self, 4000, 700, 2)
		var catDialogue = Global.loadDialogueJson("res://dialogues/Fase1Gato.json")
		%DialogueManager.start_dialogue(catDialogue, Global.Dialogue_mode.AUTO)
		cat_spawned = true

func _on_taxi_wall_body_entered(body: Node2D) -> void:
	if !taxi_spawned:
		Global.spawn_taxi_standing(self, 4500, 550, 0)
		var taxiDialogue = Global.loadDialogueJson("res://dialogues/Fase1Taxi.json")
		%DialogueManager.start_dialogue(taxiDialogue, Global.Dialogue_mode.AUTO)
		taxi_spawned = true
	


func _on_cart_wall_body_entered(body: Node2D) -> void:
	if !cart_spawned:
		Global.spawn_cart(self, 6000, 650, 1.5)
		var cartDialogue = Global.loadDialogueJson("res://dialogues/Fase1Cart.json")
		%DialogueManager.start_dialogue(cartDialogue, Global.Dialogue_mode.AUTO)
		cart_spawned = true
		trigger_phase1_Ending()
		
func trigger_phase1_Ending() -> void:
	# Espera 10 segundos mientras el juego continúa normalmente.
	await get_tree().create_timer(10.0).timeout
	ending_ready = true
	var ending_dialogue = Global.loadDialogueJson("res://dialogues/Fase1Final.json")
	%DialogueManager.start_dialogue(ending_dialogue, Global.Dialogue_mode.AUTO)
	
func on_ending_dialogue_finished() -> void:
	if ending_ready:
		Global.gameController.changeScene("res://scenes/Phase2.tscn")
		
func register_entity(entity):
	entity.entity_destroyed.connect(_on_entity_destroyed)

func _on_entity_destroyed():
	%Blip.play()
