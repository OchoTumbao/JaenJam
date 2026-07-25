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
	queue_free()
	if angel:
		if area.has_method("angel_hit"):
			area.angel_hit()
	else:
		if area.has_method("devil_hit"):
			area.devil_hit()
