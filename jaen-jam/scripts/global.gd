extends Node

var gameController : GameController
var entitySpeed = 10
var score = 0
const RAIL1 = 540
const RAIL2 = 580

enum Dialogue_mode {
	MANUAL,
	AUTO
}

func loadDialogueJson(path: String) -> Array:
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("No se pudo abrir: "+ path)
		return []
	
	var data = JSON.parse_string(file.get_as_text())
	
	if data == null:
		push_error("JSON INVALIDO: " + path)
		return []
	
	return data
	
	

func modifyScore(value: int):
	score += value

func place_entity(jumpable: bool, horizontalPosition: int, entity: Node2D):
		if jumpable:
			entity.set_initial_position(Vector2(horizontalPosition,RAIL2))
		else:
			entity.set_initial_position(Vector2(horizontalPosition,RAIL1))

func set_scores(entity: Node2D, angel_score: int, devil_score: int, ignore_score: int, player_hit_score: int):
	entity.set_angel_score(angel_score)
	entity.set_devil_score(devil_score)
	entity.set_ignore_score(ignore_score)
	entity.set_player_hit_score(player_hit_score)
	

func spawn_bee(parent: Node, jumpable: bool, horizontalPosition: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("bee")
	place_entity(jumpable,horizontalPosition,entity)
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
	
func spawn_cat(parent: Node, jumpable: bool, horizontalPosition: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("cat")
	place_entity(jumpable,horizontalPosition,entity)
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
	
func spawn_cart(parent: Node, jumpable: bool, horizontalPosition: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("carrito")
	place_entity(jumpable,horizontalPosition,entity)
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
	
func spawn_taxi(parent: Node, jumpable: bool, horizontalPosition: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("taxi")
	place_entity(jumpable,horizontalPosition,entity)
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
	
