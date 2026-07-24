extends Area2D

var travelled_dist = 0
var angel

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT
	position += direction * SPEED * delta
	
	travelled_dist += SPEED * delta
	if travelled_dist > RANGE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if angel:
		if body.has_method("angel_collision"):
			body.angel_collision()
	else:
		if body.has_method("demon_collision"):
			body.demon_collision() 
	queue_free()
