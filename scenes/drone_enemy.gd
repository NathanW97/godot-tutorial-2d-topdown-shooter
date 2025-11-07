extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction: Vector2 = Vector2(1,0)

func _ready() -> void:
	$Timer.start()

func _physics_process(_delta: float) -> void:
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_timer_timeout() -> void:
	direction = -direction
