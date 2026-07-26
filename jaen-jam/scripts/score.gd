class_name ScoreController extends Control

@onready var puntuacion = %Puntuacion

var color_normal := Color.WHITE
var posicion_original: Vector2
var last_score = 0

func _ready():
	posicion_original = puntuacion.position
	set_score(last_score)


func set_score(value: int):
	puntuacion.text = "PUNTUACION : " + str(value)

	if value < last_score:
		print("efecto negativo")
		_score_negative_effect()
	elif value > last_score:
		print("efecto positivo")
		_score_positive_effect()
	
	last_score = value


func _score_negative_effect():
	var tween = create_tween()
	tween.set_parallel(true)

	# Color rojo parpadeante
	tween.tween_property(puntuacion, "modulate", Color.RED, 0.15)
	tween.tween_property(puntuacion, "modulate", Color.WHITE, 0.15).set_delay(0.15)
	tween.tween_property(puntuacion, "modulate", Color.RED, 0.15).set_delay(0.3)
	tween.tween_property(puntuacion, "modulate", Color.WHITE, 0.15).set_delay(0.45)

	# Sacudida
	var shake = create_tween()
	for i in range(6):
		var offset = Vector2(randf_range(-8, 8), 0)
		shake.tween_property(
			puntuacion,
			"position",
			posicion_original + offset,
			0.05
		)
	shake.tween_property(
		puntuacion,
		"position",
		posicion_original,
		0.05
	)


func _score_positive_effect():
	var tween = create_tween()
	tween.set_parallel(true)

	# Verde temporal
	tween.tween_property(
		puntuacion,
		"modulate",
		Color.GREEN,
		0.2
	)

	# Pequeño zoom positivo
	tween.tween_property(
		puntuacion,
		"scale",
		Vector2(1.25, 1.25),
		0.2
	).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	# Volver a normal
	tween.chain()

	tween.tween_property(
		puntuacion,
		"modulate",
		Color.WHITE,
		0.3
	)

	tween.parallel().tween_property(
		puntuacion,
		"scale",
		Vector2.ONE,
		0.3
	)
