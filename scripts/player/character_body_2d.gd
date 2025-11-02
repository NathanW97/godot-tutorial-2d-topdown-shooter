extends Node

@export_range(0,400,10) var maxSpeed: float = 100
@export_range(0,1000,50) var maxAcceleration: float = 200
@export_range(0,1000,50) var maxDeceleration: float = 400

var body: CharacterBody2D
var desiredVelocity := Vector2.ZERO

var _input_vector := Vector2.ZERO
var _maxSpeedChange: float

func _ready() -> void:
	body = get_parent()  # CharacterBody2D of the "Player"

func _process(delta: float) -> void:
	_getMoveInput()
	desiredVelocity = _input_vector.normalized() * maxSpeed

func _physics_process(delta: float) -> void:
	var velocity = body.velocity
	#TODO Make this has a different acceleration for slowing down vs speeding up
	if (_input_vector.abs() > Vector2.ZERO):
		_maxSpeedChange = maxAcceleration * delta
	else:
		_maxSpeedChange = maxDeceleration * delta
	
	velocity = velocity.move_toward(desiredVelocity, _maxSpeedChange)
	
	body.velocity = velocity
	
	body.move_and_slide()


func _getMoveInput() -> void:
	_input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
