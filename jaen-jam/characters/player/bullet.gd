extends Area2D

var angel
var bullet_direction
var texture

const SPEED = 500

func _process(delta: float) -> void:
	position -= bullet_direction * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	if angel:
		if body.has_method("angel_collision"):
			body.angel_collision()
	else:
		if body.has_method("demon_collision"):
			body.demon_collision() 
	queue_free()

func set_texture():
	if angel:
		%devil_bullet.visible = false
	else:
		%angel_bullet.visible = false
		
