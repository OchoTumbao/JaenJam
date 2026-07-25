extends Node

var gameController : GameController
var entitySpeed = 10
var score = 0
const RAIL1 = 540
const RAIL2 = 580

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
	print("spawn_bee llamado")
	var entity = preload("res://entity.tscn").instantiate()
	print(entity)
	place_entity(jumpable,horizontalPosition,entity)
	set_scores(entity,-5,-10,10,-5)
	parent.add_child(entity)
