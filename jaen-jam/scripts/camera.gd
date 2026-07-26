extends Camera2D

@export var player: Node2D

func _ready() -> void:
	global_position = Vector2(960,540)
func _process(_delta):
	global_position.x = player.global_position.x - 200
	# No modificamos la Y
