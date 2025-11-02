extends Node

@export_range(0,400,10) var maxSpeed: float = 300
@export_range(0,1000,50) var maxAcceleration: float = 800
@export_range(0,2000,50) var maxDeceleration: float = 2000

var body: CharacterBody2D
var desiredVelocity := Vector2.ZERO

var _input_vector := Vector2.ZERO
var _maxSpeedChange: float

func _ready() -> void:
	body = get_parent()  # CharacterBody2D of the "Player"


func _process(_delta: float) -> void:
	_input_vector = Input.get_vector("move_left","move_right","move_up","move_down")
	desiredVelocity = _input_vector.normalized() * maxSpeed


func _physics_process(delta: float) -> void:
	var velocity = body.velocity

	if (_input_vector.dot(velocity) > 0):
		_maxSpeedChange = maxAcceleration * delta
	else:
		_maxSpeedChange = maxDeceleration * delta
	
	velocity = velocity.move_toward(desiredVelocity, _maxSpeedChange)
	
	body.velocity = velocity
	
	body.move_and_slide()
