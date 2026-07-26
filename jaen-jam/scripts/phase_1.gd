extends Node2D

func _ready() -> void:
	Global.scoreController = %Score
	Global.spawn_bee(self, 2000, 600, 3)
	

func _on_cat_wall_body_entered(body: Node2D) -> void:
	Global.spawn_cat(self, 4000, 700, 6)


func _on_taxi_wall_body_entered(body: Node2D) -> void:
	Global.spawn_taxi(self, 5000, 550, 5)


func _on_cart_wall_body_entered(body: Node2D) -> void:
		Global.spawn_cart(self, 6000, 650, 5)
