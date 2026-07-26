extends Node2D

var entities_alive := 0
var level = 1

func _ready() -> void:
	var dialogue = Global.loadDialogueJson("res://dialogues/Fase2.json")
	%DialogueManager.dialogue_finished.connect(on_dialogue_finished)
	%DialogueManager.start_dialogue(dialogue,Global.Dialogue_mode.AUTO)
	Global.scoreController = %Score
	
func on_dialogue_finished() -> void:
	change_level()


func _on_ignore_area_2d_area_entered(area: Area2D) -> void:
	var entity = area.get_parent()
	if entity.has_method("ignore_hit"):
		entity.ignore_hit()
		
		

func register_entity(entity):
	entities_alive += 1
	entity.entity_destroyed.connect(_on_entity_destroyed)
	
func _on_entity_destroyed():
	entities_alive -= 1

	if entities_alive == 0:
		change_level()
		

func change_level():
	match level:
		1:
			level1()
		2:
			level2()
		3:
			level3()
		4:
			level4()
		5:
			level5()
		6:
			level6()
		7: 
			finish_game()
			

func level2() -> void:
	Global.spawn_bee(self,2000,600,4)
	Global.spawn_taxi(self,2150,550,4)
	Global.spawn_bee(self,2300,600,4)
	Global.spawn_taxi(self,2450,550,4)
	Global.spawn_bee(self,2600,600,4)
	Global.spawn_taxi(self,2750,550,4)
	Global.spawn_bee(self,2900,600,4)
	Global.spawn_taxi(self,3050,550,4)
	Global.spawn_bee(self,3200,600,4)
	level +=1
	
func level5() -> void:
	Global.spawn_cart(self,2000,650,6)
	Global.spawn_cart(self,2000,450,6)
	Global.spawn_taxi(self,2200,550,6)
	Global.spawn_cart(self,2400,650,6)
	Global.spawn_cart(self,2400,450,6)
	Global.spawn_taxi(self,3200,550,10)
	Global.spawn_taxi(self,3250,550,10)
	level += 1
	
func level3() -> void:
	Global.spawn_bee(self,2000,700,6)
	Global.spawn_cart(self,2000,500,6)
	Global.spawn_taxi(self,2150,550,6)
	Global.spawn_bee(self,2300,700,6)
	Global.spawn_cart(self,2300,500,6)
	Global.spawn_taxi(self,2450,550,6)
	Global.spawn_bee(self,2600,700,6)
	Global.spawn_cart(self,2600,500,6)
	Global.spawn_taxi(self,2750,550,6)
	Global.spawn_bee(self,2900,700,6)
	Global.spawn_cart(self,2900,500,6)
	Global.spawn_taxi(self,3050,550,6)
	level +=1

func level4() -> void:
	Global.spawn_bee(self,2000,700,8)
	Global.spawn_cat(self,2250,700,8)
	Global.spawn_cart(self,2250,450,8)
	Global.spawn_bee(self,2500,700,8)
	Global.spawn_cat(self,2750,700,8)
	Global.spawn_cart(self,2750,450,8)
	level += 1

func level6() -> void:
	Global.spawn_bee(self,2000,600,10)
	Global.spawn_bee(self,2300,600,10)
	Global.spawn_bee(self,2600,600,10)
	Global.spawn_bee(self,2900,600,10)
	Global.spawn_bee(self,3200,600,10)
	Global.spawn_cart(self,2000,400,7)
	Global.spawn_cart(self,2300,400,7)
	Global.spawn_cart(self,2600,400,7)
	Global.spawn_cart(self,2900,400,7)
	Global.spawn_cart(self,3200,400,7)
	level += 1
	
func level1() -> void:
	Global.spawn_cat(self,2000,500,4)
	Global.spawn_cat(self,2300,500,4)
	Global.spawn_cat(self,2600,500,4)
	Global.spawn_cat(self,2900,500,4)
	Global.spawn_bee(self,2150,700,4)
	Global.spawn_bee(self,2450,700,4)
	Global.spawn_bee(self,2750,700,4)
	Global.spawn_bee(self,3050,700,4)
	level += 1

func finish_game() -> void:
# TODO: Finish GoodEnding BadEnding and NeutralEnding scenes and uncomment this, delete pass
#		Global.gameController.changeScene("res://scenes/GoodEnding.tscn")
#	elif Global.score <0:
#		Global.gameController.changeScene("res://scenes/BadEnding.tscn")
#	else:
#		Global.gameController.changeScene("res://scenes/NeutralEnding.tscn")
	pass
