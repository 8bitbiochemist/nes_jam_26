extends Node2D
@export var pickup_amount : int = 15

func _on_food_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		HealthManager.increase_health(pickup_amount)
		print("yum")
		queue_free()
		
