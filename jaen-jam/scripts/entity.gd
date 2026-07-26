extends Node2D

var angelScore = 0
var devilScore = 0
var ignoreScore = 0
var playerHitScore = 0
var speed = 0

func _ready() -> void:
	print("Entity creada en:", global_position)


func _physics_process(delta: float) -> void:
	global_position += Vector2.LEFT * speed
	if(global_position.x < -2.0):
		ignore_hit()

func angel_hit() -> void:
	queue_free()
	Global.modifyScore(angelScore)
	
func devil_hit() -> void:
	queue_free()
	Global.modifyScore(devilScore)

func ignore_hit() -> void:
	print("ignoreHit")
	queue_free()
	Global.modifyScore(ignoreScore)

func playerHit_hit() -> void:
	print("playerHit")
	queue_free()
	Global.modifyScore(playerHitScore)

func set_initial_position(position: Vector2) -> void:
	global_position = position
	
func set_animation(name):
	%Drawing.animation = name
	%Drawing.play()
	
func set_angel_score(value: int) -> void:
	angelScore = value

func set_devil_score(value: int) -> void:
	devilScore = value

func set_ignore_score(value: int) -> void:
	ignoreScore = value

func set_player_hit_score(value: int) -> void:
	playerHitScore = value

func set_speed(value: int):
	speed = value

func set_hitbox(value: Global.Entity_Hitboxes):
	match value:
		Global.Entity_Hitboxes.BEE:
			%Abeja.disabled = false
		Global.Entity_Hitboxes.CART:
			%Carrito.disabled = false
		Global.Entity_Hitboxes.CAT:
			%Gato.disabled = false
		Global.Entity_Hitboxes.TAXI:
			%Taxi.disabled = false
