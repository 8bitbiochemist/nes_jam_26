extends CharacterBody2D

#dictates the speed of the character
@export var SPEED = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


#This function runs whatever is in it when the game starts 
#It currently activates the timer node which helps with the 
#life drain mechanic
func _ready() -> void:
	$Timer.wait_time = 2
	$Timer.start()
	
	
func _physics_process(_delta: float) -> void:
#Movement
	var direction := Input.get_vector("Left", "Right", "Up","Down")
	velocity = direction * SPEED
	if velocity.length() > 1:
		velocity.normalized()
	move_and_slide()
	actions()
		
# this function is used to test that the players actions
#will be changed when the assets are ready
func actions():
	if Input.is_action_pressed("Item "):
		$"Testing Buttons".text="Item Used"
	elif Input.is_action_pressed("Interact"):
		$"Testing Buttons".text="MUNCH"
	else:
		$"Testing Buttons". text = "nothing"
		
		

	
		
#this is the life drain function it takes an argument (amt)
# and adds it to the current_health variable
func life_drain(amt):
	HealthManager.current_health += amt
	HealthManager.current_health = clamp(HealthManager.current_health,0,HealthManager.max_health)
	

#This is hear to actually make the player lose health
#over time. 
func _on_timer_timeout() -> void:
	life_drain(-1)
	print(HealthManager.current_health)
