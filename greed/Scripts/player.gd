extends CharacterBody2D

#dictates the speed of the character
@export var SPEED = 300.0


func _physics_process(_delta: float) -> void:
#Movement
	var direction := Input.get_vector("Left", "Right", "Up","Down")
	velocity = direction * SPEED
	if velocity.length() > 1:
		velocity.normalized()
	move_and_slide()
	
