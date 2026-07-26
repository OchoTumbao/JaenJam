extends Node

var gameController : GameController
var scoreController : ScoreController
var score = 0

enum Dialogue_mode {
	MANUAL,
	AUTO
}

enum Entity_Hitboxes {
	BEE,
	CART,
	CAT,
	TAXI
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
	scoreController.set_score(score)

func set_scores(entity: Node2D, angel_score: int, devil_score: int, ignore_score: int, player_hit_score: int):
	entity.set_angel_score(angel_score)
	entity.set_devil_score(devil_score)
	entity.set_ignore_score(ignore_score)
	entity.set_player_hit_score(player_hit_score)
	

func spawn_bee(parent: Node, horizontalPosition: int, verticalPosition: int, speed: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("bee")
	entity.set_speed(speed)
	entity.set_hitbox(Global.Entity_Hitboxes.BEE)
	entity.set_initial_position(Vector2(horizontalPosition,verticalPosition))
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
	
func spawn_cat(parent: Node, horizontalPosition: int, verticalPosition: int, speed: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("cat")
	entity.set_speed(speed)
	entity.set_hitbox(Global.Entity_Hitboxes.CAT)
	entity.set_initial_position(Vector2(horizontalPosition,verticalPosition))
	set_scores(entity,5,-10,-5,10)
	parent.add_child(entity)
	
func spawn_cart(parent: Node,horizontalPosition: int, verticalPosition: int, speed: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("carrito")
	entity.set_speed(speed)
	entity.set_hitbox(Global.Entity_Hitboxes.CART)
	entity.set_initial_position(Vector2(horizontalPosition,verticalPosition))
	set_scores(entity,10,-5,-10,5)
	parent.add_child(entity)
	
func spawn_taxi(parent: Node, horizontalPosition: int, verticalPosition:int, speed: int):
	var entity = load("res://entity.tscn").instantiate()
	entity.set_animation("taxi")
	entity.set_speed(speed)
	entity.set_hitbox(Global.Entity_Hitboxes.TAXI)
	entity.set_initial_position(Vector2(horizontalPosition,verticalPosition))
	set_scores(entity,-10,10,-5,-5)
	parent.add_child(entity)
	
