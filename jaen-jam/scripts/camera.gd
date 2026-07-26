extends Camera2D

@export var player: Node2D
@export var left_area: Area2D

func _ready() -> void:
	global_position = Vector2(960,540)
func _process(_delta):
	global_position.x = player.global_position.x - 200
	var half_width = get_viewport_rect().size.x / 2
	left_area.global_position = Vector2(
		global_position.x - half_width,
		global_position.y
	)


func _on_ignore_area_area_entered(area: Area2D) -> void:
	var entity = area.get_parent()
	if entity.has_method("ignore_hit"):
		entity.ignore_hit()
		
