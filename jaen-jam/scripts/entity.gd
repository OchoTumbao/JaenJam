extends Node2D

var texture = ""
var angelScore = 0
var devilScore = 0
var ignoreScore = 0
var playerHitScore = 0

func _ready() -> void:
	print("Entity creada en:", global_position)


func _physics_process(delta: float) -> void:
	global_position += Vector2.LEFT * Global.entitySpeed

func angel_hit() -> void:
	queue_free()
	Global.modifyScore(angelScore)
	
func devil_hit() -> void:
	queue_free()
	Global.modifyScore(devilScore)

func ignore_hit() -> void:
	queue_free()
	Global.modifyScore(ignoreScore)

func playerHit_hit() -> void:
	queue_free()
	Global.modifyScore(playerHitScore)

func set_initial_position(position: Vector2) -> void:
	global_position = position

func set_texture(texture: String) -> void:
	var drawing = load(texture)
	%Drawing.texture = drawing
	
func set_angel_score(value: int) -> void:
	angelScore = value

func set_devil_score(value: int) -> void:
	devilScore = value

func set_ignore_score(value: int) -> void:
	ignoreScore = value

func set_player_hit_score(value: int) -> void:
	playerHitScore = value

func _on_area_2d_area_entered(area: Area2D) -> void:
	angel_hit()
	devil_hit()
	
