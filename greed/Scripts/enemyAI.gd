extends CharacterBody2D
@export var wander_speed: float = 60.0
@export var chase_speed: float = 75.0
@export var attack_damage: int=12
@export var detection_radius: float = 80.0
@export var wander_radius: float = 75

@export var agent: NavigationAgent2D


var spawn_position: Vector2
enum {Patrol, detected}

var state_machine
var player: Node = null
var direction: Vector2 = Vector2.ZERO

func _ready():
	spawn_position = global_position
func _physics_process(_delta: float) -> void:
	move_and_slide()
