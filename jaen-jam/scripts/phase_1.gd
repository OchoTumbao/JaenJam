extends Node2D

func _ready() -> void:
	Global.spawn_bee(self, false, 1920)
	

func _on_cat_wall_body_entered(body: Node2D) -> void:
	Global.spawn_cat(self, true, 4000)


func _on_taxi_wall_body_entered(body: Node2D) -> void:
	Global.spawn_taxi(self, true, 6000)
	


func _on_cart_wall_body_entered(body: Node2D) -> void:
		Global.spawn_cart(self, true, 7000)
