extends CharacterBody2D

@onready var bullet_scene = preload("res://characters/player/bullet.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if velocity.length() > 0.0:
		%PC.play("walk") 
	
	if Input.is_action_just_pressed("angel"):
		shoot(true)
	if Input.is_action_just_pressed("devil"):
		shoot(false)

func shoot(angel: bool):
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	bullet.bullet_direction = (position - get_global_mouse_position()).normalized()
	bullet.angel = angel
	bullet.set_texture()
	get_parent().add_child(bullet)


func _on_area_2d_area_entered(area: Area2D) -> void:
	var entity = area.get_parent()
	if entity.has_method("playerHit_hit"):
		entity.playerHit_hit()
	
