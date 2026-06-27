extends State
class_name Patrol

@export var enemy: CharacterBody2D
@export var move_speed := 10.0
var player: CharacterBody2D

var move_direction: Vector2
var wander_time : float


func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func Enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("player")
	
	
func Update(_delta: float):
	if wander_time > 0:
		wander_time -= _delta
	
	else:
		randomize_wander()
		

func Physics_update(_delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("GET THAT BASTARD!!!!")
		Transitioned.emit(self,"detected")
