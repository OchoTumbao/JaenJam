extends Area2D

var angel
var bullet_direction
var texture

const SPEED = 500

func _process(delta: float) -> void:
	position -= bullet_direction * SPEED * delta


func set_texture():
	if angel:
		%devil_bullet.visible = false
	else:
		%angel_bullet.visible = false
		


func _on_area_entered(area: Area2D) -> void:
	var entity = area.get_parent()
	if angel:
		if entity.has_method("angel_hit"):
			entity.angel_hit()
			queue_free()
	else:
		if entity.has_method("devil_hit"):
			entity.devil_hit()
			queue_free()
